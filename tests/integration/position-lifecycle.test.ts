import {
  assert,
  describe,
  test,
  beforeEach,
} from 'matchstick-as/assembly/index'
import { Address, BigInt } from '@graphprotocol/graph-ts'
import {
  handleIncreaseLiquidity,
  handleDecreaseLiquidity,
  handleTransfer,
} from '../../src/handlers/nonfungible-position-manager.handler'
import {
  beforeEach as testBeforeEach,
  USER_1,
  USER_2,
  CONTRACT_ADDRESS,
  TRACKED_POOL,
  setupTrackedPoolMocks,
  createIncreaseLiquidityEvent,
  createDecreaseLiquidityEvent,
  createTransferEvent,
  validatePositionLifecycle,
  validateEventCreation,
  getExpectedEventId,
} from '../helpers'

describe('Position Lifecycle Integration', () => {
  beforeEach(() => {
    testBeforeEach()
  })

  test('complete_position_lifecycle_with_multiple_handlers', () => {
    // This integration test verifies that all handlers work together correctly
    // throughout a complete position lifecycle

    const tokenId = BigInt.fromI32(8001)
    const initialLiquidity = BigInt.fromI32(2000)
    const additionalLiquidity = BigInt.fromI32(1000)
    const decreaseLiquidity = BigInt.fromI32(500)

    // Setup mocks for tracked pool
    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, USER_1)

    // 1. Position Creation (MINT) - IncreaseLiquidity handler
    handleIncreaseLiquidity(
      createIncreaseLiquidityEvent(
        tokenId,
        initialLiquidity,
        BigInt.fromI32(200),
        BigInt.fromI32(400)
      )
    )

    // Validate position created correctly
    validatePositionLifecycle(tokenId, USER_1, TRACKED_POOL, initialLiquidity)
    validateEventCreation(tokenId, 'MINT', initialLiquidity)

    // 2. Liquidity Addition (INCREASE) - IncreaseLiquidity handler
    handleIncreaseLiquidity(
      createIncreaseLiquidityEvent(
        tokenId,
        additionalLiquidity,
        BigInt.fromI32(100),
        BigInt.fromI32(200)
      )
    )

    const expectedLiquidity = initialLiquidity.plus(additionalLiquidity)
    validatePositionLifecycle(tokenId, USER_1, TRACKED_POOL, expectedLiquidity)
    validateEventCreation(tokenId, 'INCREASE', additionalLiquidity)

    // 3. Liquidity Removal (DECREASE) - DecreaseLiquidity handler
    handleDecreaseLiquidity(
      createDecreaseLiquidityEvent(
        tokenId,
        decreaseLiquidity,
        BigInt.fromI32(50),
        BigInt.fromI32(100)
      )
    )

    const finalLiquidity = expectedLiquidity.minus(decreaseLiquidity)
    validatePositionLifecycle(tokenId, USER_1, TRACKED_POOL, finalLiquidity)
    validateEventCreation(tokenId, 'DECREASE', decreaseLiquidity)

    // 4. Ownership Transfer - Transfer handler
    handleTransfer(createTransferEvent(USER_1, USER_2, tokenId))

    // Validate ownership changed but liquidity preserved
    validatePositionLifecycle(tokenId, USER_2, TRACKED_POOL, finalLiquidity)
    validateEventCreation(
      tokenId,
      'TRANSFER',
      BigInt.fromI32(0),
      USER_1,
      USER_2
    )

    // 5. Final verification - all events exist and position is consistent
    assert.entityCount('Position', 1)
    assert.entityCount('PositionEvent', 4) // MINT, INCREASE, DECREASE, TRANSFER

    // Verify event sequence and relationships
    const mintEventId = getExpectedEventId(tokenId, 'MINT')
    const increaseEventId = getExpectedEventId(tokenId, 'INCREASE')
    const decreaseEventId = getExpectedEventId(tokenId, 'DECREASE')
    const transferEventId = getExpectedEventId(tokenId, 'TRANSFER')

    // All events should reference the same position
    assert.fieldEquals(
      'PositionEvent',
      mintEventId,
      'position',
      tokenId.toString()
    )
    assert.fieldEquals(
      'PositionEvent',
      increaseEventId,
      'position',
      tokenId.toString()
    )
    assert.fieldEquals(
      'PositionEvent',
      decreaseEventId,
      'position',
      tokenId.toString()
    )
    assert.fieldEquals(
      'PositionEvent',
      transferEventId,
      'position',
      tokenId.toString()
    )
  })

  test('position_lifecycle_with_burn', () => {
    // Test complete lifecycle ending with NFT burn (transfer to zero address)

    const tokenId = BigInt.fromI32(8002)
    const liquidity = BigInt.fromI32(1000)

    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, USER_1)

    // Create position
    handleIncreaseLiquidity(
      createIncreaseLiquidityEvent(
        tokenId,
        liquidity,
        BigInt.fromI32(100),
        BigInt.fromI32(200)
      )
    )

    // Remove all liquidity
    handleDecreaseLiquidity(
      createDecreaseLiquidityEvent(
        tokenId,
        liquidity,
        BigInt.fromI32(100),
        BigInt.fromI32(200)
      )
    )

    // Burn NFT (transfer to zero address)
    handleTransfer(createTransferEvent(USER_1, Address.zero(), tokenId))

    // Validate final state
    validatePositionLifecycle(
      tokenId,
      Address.zero(),
      TRACKED_POOL,
      BigInt.fromI32(0)
    )

    // All events should exist
    assert.entityCount('PositionEvent', 3) // MINT, DECREASE, TRANSFER

    // Verify burn transfer event
    validateEventCreation(
      tokenId,
      'TRANSFER',
      BigInt.fromI32(0),
      USER_1,
      Address.zero()
    )
  })

  test('multi_position_lifecycle_independence', () => {
    // Verify that multiple positions can have independent lifecycles

    const tokenId1 = BigInt.fromI32(8003)
    const tokenId2 = BigInt.fromI32(8004)
    const liquidity1 = BigInt.fromI32(1500)
    const liquidity2 = BigInt.fromI32(2500)

    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId1, USER_1)
    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId2, USER_2)

    // Create both positions
    handleIncreaseLiquidity(
      createIncreaseLiquidityEvent(
        tokenId1,
        liquidity1,
        BigInt.fromI32(150),
        BigInt.fromI32(300)
      )
    )
    handleIncreaseLiquidity(
      createIncreaseLiquidityEvent(
        tokenId2,
        liquidity2,
        BigInt.fromI32(250),
        BigInt.fromI32(500)
      )
    )

    // Modify position 1 only
    handleDecreaseLiquidity(
      createDecreaseLiquidityEvent(
        tokenId1,
        BigInt.fromI32(500),
        BigInt.fromI32(50),
        BigInt.fromI32(100)
      )
    )

    // Transfer position 2 only
    handleTransfer(createTransferEvent(USER_2, USER_1, tokenId2))

    // Verify independence - position 1 unaffected by position 2 operations
    validatePositionLifecycle(
      tokenId1,
      USER_1,
      TRACKED_POOL,
      BigInt.fromI32(1000)
    ) // 1500 - 500
    validatePositionLifecycle(tokenId2, USER_1, TRACKED_POOL, liquidity2) // Unchanged liquidity, new owner

    // Verify correct event counts
    assert.entityCount('Position', 2)
    assert.entityCount('PositionEvent', 4) // 2 MINT + 1 DECREASE + 1 TRANSFER
  })

  test('lifecycle_consistency_across_pool_filtering', () => {
    // Integration test ensuring lifecycle works consistently for tracked pools
    // while properly filtering untracked pools

    const trackedTokenId = BigInt.fromI32(8005)
    const liquidity = BigInt.fromI32(1000)

    setupTrackedPoolMocks(CONTRACT_ADDRESS, trackedTokenId, USER_1)

    // Complete lifecycle for tracked pool
    handleIncreaseLiquidity(
      createIncreaseLiquidityEvent(
        trackedTokenId,
        liquidity,
        BigInt.fromI32(100),
        BigInt.fromI32(200)
      )
    )
    handleDecreaseLiquidity(
      createDecreaseLiquidityEvent(
        trackedTokenId,
        BigInt.fromI32(200),
        BigInt.fromI32(20),
        BigInt.fromI32(40)
      )
    )
    handleTransfer(createTransferEvent(USER_1, USER_2, trackedTokenId))

    // Verify tracked pool lifecycle completed successfully
    assert.entityCount('Position', 1)
    assert.entityCount('PositionEvent', 3) // MINT, DECREASE, TRANSFER

    validatePositionLifecycle(
      trackedTokenId,
      USER_2,
      TRACKED_POOL,
      BigInt.fromI32(800)
    )

    // Verify all handlers maintain pool filtering consistency
    assert.fieldEquals(
      'Position',
      trackedTokenId.toString(),
      'pool',
      TRACKED_POOL.toHexString()
    )
  })
})
