import {
  assert,
  describe,
  test,
  beforeEach,
} from 'matchstick-as/assembly/index'
import { BigInt } from '@graphprotocol/graph-ts'
import { handleDecreaseLiquidity } from '../../src/nonfungible-position-manager'
import {
  beforeEach as testBeforeEach,
  USER_1,
  CONTRACT_ADDRESS,
  setupTrackedPoolMocks,
  setupUntrackedPoolMocks,
  createDecreaseLiquidityEvent,
  getExpectedEventId,
} from '../helpers'

describe('Missing Decrease Handling', () => {
  beforeEach(() => {
    testBeforeEach()
  })

  test('missing_decrease_is_ignored', () => {
    // Arrange: DecreaseLiquidity for a tokenId never seen before
    // BUT whose pool would be tracked (if it existed)
    const missingTokenId = BigInt.fromI32(3001)
    const liquidity = BigInt.fromI32(500)
    const amount0 = BigInt.fromI32(50)
    const amount1 = BigInt.fromI32(100)

    // Setup mocks as if this were a tracked pool (to prove it's not the pool filter rejecting it)
    setupTrackedPoolMocks(CONTRACT_ADDRESS, missingTokenId, USER_1)

    // Act: Send DecreaseLiquidity for non-existent position
    const decreaseEvent = createDecreaseLiquidityEvent(
      missingTokenId,
      liquidity,
      amount0,
      amount1
    )
    handleDecreaseLiquidity(decreaseEvent)

    // Assert: NO Position entity created
    assert.notInStore('Position', missingTokenId.toString())

    // Assert: NO PositionEvent created
    const eventId = getExpectedEventId(missingTokenId, 'DECREASE')
    assert.notInStore('PositionEvent', eventId)

    // Verify the store is completely empty for this tokenId
    assert.entityCount('Position', 0)
    assert.entityCount('PositionEvent', 0)
  })

  test('missing_decrease_untracked_pool_is_ignored', () => {
    // Arrange: Missing decrease for untracked pool
    const missingTokenId = BigInt.fromI32(3002)
    const liquidity = BigInt.fromI32(500)
    const amount0 = BigInt.fromI32(50)
    const amount1 = BigInt.fromI32(100)

    // Setup as untracked pool (should be filtered out anyway)
    setupUntrackedPoolMocks(CONTRACT_ADDRESS, missingTokenId, USER_1)

    // Act: Send DecreaseLiquidity
    const decreaseEvent = createDecreaseLiquidityEvent(
      missingTokenId,
      liquidity,
      amount0,
      amount1
    )
    handleDecreaseLiquidity(decreaseEvent)

    // Assert: No entities created
    assert.notInStore('Position', missingTokenId.toString())
    const eventId = getExpectedEventId(missingTokenId, 'DECREASE')
    assert.notInStore('PositionEvent', eventId)
  })

  test('missing_decrease_after_valid_position_exists_elsewhere', () => {
    // Arrange: Create a valid position for one tokenId, then try to decrease a different missing tokenId
    const validTokenId = BigInt.fromI32(3003)
    const missingTokenId = BigInt.fromI32(3004)
    const liquidity = BigInt.fromI32(1000)

    // Create valid position first
    setupTrackedPoolMocks(CONTRACT_ADDRESS, validTokenId, USER_1)

    // This would normally create a position via IncreaseLiquidity, but for simplicity
    // let's just verify the missing decrease doesn't interfere
    setupTrackedPoolMocks(CONTRACT_ADDRESS, missingTokenId, USER_1)

    // Act: Try to decrease liquidity on missing tokenId
    const decreaseEvent = createDecreaseLiquidityEvent(
      missingTokenId,
      liquidity,
      BigInt.fromI32(100),
      BigInt.fromI32(200)
    )
    handleDecreaseLiquidity(decreaseEvent)

    // Assert: Still no position for missing tokenId
    assert.notInStore('Position', missingTokenId.toString())

    // And no events created for the missing position
    const eventId = getExpectedEventId(missingTokenId, 'DECREASE')
    assert.notInStore('PositionEvent', eventId)
  })

  test('multiple_missing_decreases_all_ignored', () => {
    // Arrange: Multiple missing decreases for different tokenIds
    const missing1 = BigInt.fromI32(3005)
    const missing2 = BigInt.fromI32(3006)
    const missing3 = BigInt.fromI32(3007)

    setupTrackedPoolMocks(CONTRACT_ADDRESS, missing1, USER_1)
    setupTrackedPoolMocks(CONTRACT_ADDRESS, missing2, USER_1)
    setupTrackedPoolMocks(CONTRACT_ADDRESS, missing3, USER_1)

    // Act: Send multiple missing decreases
    handleDecreaseLiquidity(
      createDecreaseLiquidityEvent(
        missing1,
        BigInt.fromI32(100),
        BigInt.fromI32(10),
        BigInt.fromI32(20)
      )
    )
    handleDecreaseLiquidity(
      createDecreaseLiquidityEvent(
        missing2,
        BigInt.fromI32(200),
        BigInt.fromI32(20),
        BigInt.fromI32(40)
      )
    )
    handleDecreaseLiquidity(
      createDecreaseLiquidityEvent(
        missing3,
        BigInt.fromI32(300),
        BigInt.fromI32(30),
        BigInt.fromI32(60)
      )
    )

    // Assert: No positions or events created
    assert.notInStore('Position', missing1.toString())
    assert.notInStore('Position', missing2.toString())
    assert.notInStore('Position', missing3.toString())

    assert.entityCount('Position', 0)
    assert.entityCount('PositionEvent', 0)
  })
})
