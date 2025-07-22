import {
  assert,
  describe,
  test,
  clearStore,
  beforeAll,
  afterAll,
} from 'matchstick-as/assembly/index'
import { Address, BigInt } from '@graphprotocol/graph-ts'
// Event types are used by the helper functions
import {
  handleDecreaseLiquidity,
  handleIncreaseLiquidity,
  handleTransfer,
} from '../../src/nonfungible-position-manager'

// Import test helpers
import {
  TRACKED_POOL,
  CONTRACT_ADDRESS,
  setupTrackedPoolMocks,
  setupUntrackedPoolMocks,
  createIncreaseLiquidityEvent,
  createDecreaseLiquidityEvent,
  createTransferEvent,
  getExpectedEventId,
} from '../helpers'

// All helper functions now imported from ../helpers

describe('Nonfungible Position Manager', () => {
  beforeAll(() => {
    // Setup any global mocks if needed
  })

  afterAll(() => {
    clearStore()
  })

  describe('Pool Filtering', () => {
    test('handleIncreaseLiquidity - tracked pool creates position with pool field', () => {
      // Setup
      const tokenId = BigInt.fromI32(1001)
      const liquidity = BigInt.fromI32(1000)
      const amount0 = BigInt.fromI32(100)
      const amount1 = BigInt.fromI32(200)
      const owner = Address.fromString(
        '0x1234567890123456789012345678901234567890'
      )

      // Setup mocks for tracked pool
      setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, owner)

      // Create mock event
      const mockEvent = createIncreaseLiquidityEvent(
        tokenId,
        liquidity,
        amount0,
        amount1
      )

      // Execute
      handleIncreaseLiquidity(mockEvent)

      // Assert position exists with correct pool
      assert.fieldEquals(
        'Position',
        tokenId.toString(),
        'pool',
        TRACKED_POOL.toHexString()
      )
      assert.fieldEquals(
        'Position',
        tokenId.toString(),
        'owner',
        owner.toHexString()
      )
      assert.fieldEquals(
        'Position',
        tokenId.toString(),
        'liquidity',
        liquidity.toString()
      )

      // Assert MINT event was created
      const expectedEventId = getExpectedEventId(tokenId, 'MINT')
      assert.fieldEquals('PositionEvent', expectedEventId, 'type', 'MINT')
      assert.fieldEquals(
        'PositionEvent',
        expectedEventId,
        'amount',
        liquidity.toString()
      )
      assert.fieldEquals(
        'PositionEvent',
        expectedEventId,
        'amount0',
        amount0.toString()
      )
      assert.fieldEquals(
        'PositionEvent',
        expectedEventId,
        'amount1',
        amount1.toString()
      )
    })

    test('handleIncreaseLiquidity - untracked pool ignores position (no entities created)', () => {
      // Setup
      const tokenId = BigInt.fromI32(1002)
      const liquidity = BigInt.fromI32(1000)
      const amount0 = BigInt.fromI32(100)
      const amount1 = BigInt.fromI32(200)
      const owner = Address.fromString(
        '0x1234567890123456789012345678901234567890'
      )

      // Setup mocks for untracked pool
      setupUntrackedPoolMocks(CONTRACT_ADDRESS, tokenId, owner)

      // Create mock event
      const mockEvent = createIncreaseLiquidityEvent(
        tokenId,
        liquidity,
        amount0,
        amount1
      )

      // Execute
      handleIncreaseLiquidity(mockEvent)

      // Assert NO position was created
      assert.notInStore('Position', tokenId.toString())

      // Assert NO event was created
      const eventId = getExpectedEventId(tokenId, 'MINT')
      assert.notInStore('PositionEvent', eventId)
    })

    test('handleDecreaseLiquidity - untracked pool ignores existing position', () => {
      // Setup
      const tokenId = BigInt.fromI32(1003)
      const liquidity = BigInt.fromI32(500)
      const amount0 = BigInt.fromI32(50)
      const amount1 = BigInt.fromI32(100)
      const owner = Address.fromString(
        '0x1234567890123456789012345678901234567890'
      )

      // Setup mocks for untracked pool
      setupUntrackedPoolMocks(CONTRACT_ADDRESS, tokenId, owner)

      // Create mock event
      const mockEvent = createDecreaseLiquidityEvent(
        tokenId,
        liquidity,
        amount0,
        amount1
      )

      // Execute
      handleDecreaseLiquidity(mockEvent)

      // Assert NO position was created
      assert.notInStore('Position', tokenId.toString())

      // Assert NO event was created
      const eventId = getExpectedEventId(tokenId, 'DECREASE')
      assert.notInStore('PositionEvent', eventId)
    })

    test('handleTransfer - untracked pool ignores NFT mint', () => {
      // Setup
      const tokenId = BigInt.fromI32(1004)
      const from = Address.zero()
      const to = Address.fromString(
        '0x1234567890123456789012345678901234567890'
      )

      // Setup mocks for untracked pool
      setupUntrackedPoolMocks(CONTRACT_ADDRESS, tokenId, to)

      // Create mock transfer event
      const mockEvent = createTransferEvent(from, to, tokenId)

      // Execute
      handleTransfer(mockEvent)

      // Assert NO position was created
      assert.notInStore('Position', tokenId.toString())

      // Assert NO transfer event was created
      const eventId = getExpectedEventId(tokenId, 'TRANSFER')
      assert.notInStore('PositionEvent', eventId)
    })

    test('subsequent calls use cached pool check for tracked position', () => {
      // Setup - create tracked position first
      const tokenId = BigInt.fromI32(1005)
      const initialLiquidity = BigInt.fromI32(1000)
      const owner = Address.fromString(
        '0x1234567890123456789012345678901234567890'
      )

      // Setup mocks for tracked pool (first call)
      setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, owner)

      // Create position with IncreaseLiquidity
      const mockIncreaseEvent = createIncreaseLiquidityEvent(
        tokenId,
        initialLiquidity,
        BigInt.fromI32(100),
        BigInt.fromI32(200)
      )
      handleIncreaseLiquidity(mockIncreaseEvent)

      // Verify position exists with pool field
      assert.fieldEquals(
        'Position',
        tokenId.toString(),
        'pool',
        TRACKED_POOL.toHexString()
      )

      // Now test subsequent decrease (should work without factory calls since position exists)
      const decreaseLiquidity = BigInt.fromI32(300)
      const mockDecreaseEvent = createDecreaseLiquidityEvent(
        tokenId,
        decreaseLiquidity,
        BigInt.fromI32(30),
        BigInt.fromI32(60)
      )

      // Execute decrease
      handleDecreaseLiquidity(mockDecreaseEvent)

      // Assert position liquidity decreased (proving it processed the tracked position)
      const expectedLiquidity = initialLiquidity.minus(decreaseLiquidity)
      assert.fieldEquals(
        'Position',
        tokenId.toString(),
        'liquidity',
        expectedLiquidity.toString()
      )

      // Assert decrease event was created
      const expectedEventId = getExpectedEventId(tokenId, 'DECREASE')
      assert.fieldEquals('PositionEvent', expectedEventId, 'type', 'DECREASE')
    })
  })

  test('handleIncreaseLiquidity creates position and event', () => {
    // Setup
    const tokenId = BigInt.fromI32(1)
    const liquidity = BigInt.fromI32(1000)
    const amount0 = BigInt.fromI32(100)
    const amount1 = BigInt.fromI32(200)
    const owner = Address.fromString(
      '0x1234567890123456789012345678901234567890'
    )

    // Setup mocks for tracked pool
    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, owner)

    // Create mock event
    const mockEvent = createIncreaseLiquidityEvent(
      tokenId,
      liquidity,
      amount0,
      amount1
    )

    // Execute
    handleIncreaseLiquidity(mockEvent)

    // Assert position exists with pool field
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'pool',
      TRACKED_POOL.toHexString()
    )
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'owner',
      owner.toHexString()
    )
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'liquidity',
      liquidity.toString()
    )

    // Assert MINT event was created
    const expectedEventId = getExpectedEventId(tokenId, 'MINT')
    assert.fieldEquals('PositionEvent', expectedEventId, 'type', 'MINT')
    assert.fieldEquals(
      'PositionEvent',
      expectedEventId,
      'amount',
      liquidity.toString()
    )
    assert.fieldEquals(
      'PositionEvent',
      expectedEventId,
      'amount0',
      amount0.toString()
    )
    assert.fieldEquals(
      'PositionEvent',
      expectedEventId,
      'amount1',
      amount1.toString()
    )
  })

  test('handleDecreaseLiquidity updates position and creates event', () => {
    // Setup - first create a position
    const tokenId = BigInt.fromI32(2)
    const initialLiquidity = BigInt.fromI32(1000)
    const decreaseLiquidity = BigInt.fromI32(500)
    const amount0 = BigInt.fromI32(50)
    const amount1 = BigInt.fromI32(100)
    const owner = Address.fromString(
      '0x1234567890123456789012345678901234567890'
    )

    // Setup mocks for tracked pool
    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, owner)

    // Create position first with IncreaseLiquidity
    const mockIncreaseEvent = createIncreaseLiquidityEvent(
      tokenId,
      initialLiquidity,
      BigInt.fromI32(100),
      BigInt.fromI32(200)
    )
    handleIncreaseLiquidity(mockIncreaseEvent)

    // Now create decrease event
    const mockDecreaseEvent = createDecreaseLiquidityEvent(
      tokenId,
      decreaseLiquidity,
      amount0,
      amount1
    )

    // Execute
    handleDecreaseLiquidity(mockDecreaseEvent)

    // Assert position liquidity decreased
    const expectedLiquidity = initialLiquidity.minus(decreaseLiquidity)
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'liquidity',
      expectedLiquidity.toString()
    )

    // Assert decrease event was created
    const expectedEventId = getExpectedEventId(tokenId, 'DECREASE')
    assert.fieldEquals('PositionEvent', expectedEventId, 'type', 'DECREASE')
    assert.fieldEquals(
      'PositionEvent',
      expectedEventId,
      'amount',
      decreaseLiquidity.toString()
    )
  })

  test('handleTransfer from zero address creates position', () => {
    // Setup
    const tokenId = BigInt.fromI32(3)
    const from = Address.zero()
    const to = Address.fromString('0x1234567890123456789012345678901234567890')

    // Setup mocks for tracked pool
    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, to)

    // Create mock transfer event
    const mockEvent = createTransferEvent(from, to, tokenId)

    // Execute
    handleTransfer(mockEvent)

    // Assert position exists with correct owner and pool
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'pool',
      TRACKED_POOL.toHexString()
    )
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'owner',
      to.toHexString()
    )

    // Assert transfer event was created
    const expectedEventId = getExpectedEventId(tokenId, 'TRANSFER')
    assert.fieldEquals('PositionEvent', expectedEventId, 'type', 'TRANSFER')
  })

  test('handleTransfer to zero address (burn) updates position', () => {
    // Setup - first create a position
    const tokenId = BigInt.fromI32(4)
    const owner = Address.fromString(
      '0x1234567890123456789012345678901234567890'
    )

    // Setup mocks for tracked pool
    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, owner)

    // Create position first
    const mockIncreaseEvent = createIncreaseLiquidityEvent(
      tokenId,
      BigInt.fromI32(1000),
      BigInt.fromI32(100),
      BigInt.fromI32(200)
    )
    handleIncreaseLiquidity(mockIncreaseEvent)

    // Now create burn transfer
    const mockTransferEvent = createTransferEvent(
      owner,
      Address.zero(),
      tokenId
    )

    // Execute
    handleTransfer(mockTransferEvent)

    // Assert position owner is now zero address
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'owner',
      Address.zero().toHexString()
    )

    // Assert transfer event was created
    const expectedEventId = getExpectedEventId(tokenId, 'TRANSFER')
    assert.fieldEquals('PositionEvent', expectedEventId, 'type', 'TRANSFER')
  })

  test('follows complete position lifecycle as specified in README', () => {
    const tokenId = BigInt.fromI32(100)
    const user1 = Address.fromString(
      '0x3333333333333333333333333333333333333333'
    )
    const user2 = Address.fromString(
      '0x4444444444444444444444444444444444444444'
    )

    // Setup mocks for tracked pool
    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, user1)

    // 1. NFT Mint: Transfer(0x000 → user) → Creates position + TRANSFER event
    // But first IncreaseLiquidity fires (adds initial liquidity) → MINT event
    const mintLiquidityEvent = createIncreaseLiquidityEvent(
      tokenId,
      BigInt.fromI32(1000),
      BigInt.fromI32(100),
      BigInt.fromI32(200)
    )
    handleIncreaseLiquidity(mintLiquidityEvent)

    // Check position was created and MINT event exists
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'pool',
      TRACKED_POOL.toHexString()
    )
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'owner',
      user1.toHexString()
    )
    assert.fieldEquals('Position', tokenId.toString(), 'liquidity', '1000')

    // Assert MINT event was created
    const mintEventId = getExpectedEventId(tokenId, 'MINT')
    assert.fieldEquals('PositionEvent', mintEventId, 'type', 'MINT')
    assert.fieldEquals('PositionEvent', mintEventId, 'amount', '1000')

    // Then Transfer event fires (NFT mint)
    const transferMintEvent = createTransferEvent(
      Address.zero(),
      user1,
      tokenId
    )
    handleTransfer(transferMintEvent)

    // Assert TRANSFER event was created for the mint
    const transferMintEventId = getExpectedEventId(tokenId, 'TRANSFER')
    assert.fieldEquals('PositionEvent', transferMintEventId, 'type', 'TRANSFER')
    assert.fieldEquals(
      'PositionEvent',
      transferMintEventId,
      'sender',
      Address.zero().toHexString()
    )
    assert.fieldEquals(
      'PositionEvent',
      transferMintEventId,
      'recipient',
      user1.toHexString()
    )

    // 2. Add Liquidity: IncreaseLiquidity → INCREASE event (subsequent times)
    const addLiquidityEvent = createIncreaseLiquidityEvent(
      tokenId,
      BigInt.fromI32(500),
      BigInt.fromI32(50),
      BigInt.fromI32(100)
    )
    handleIncreaseLiquidity(addLiquidityEvent)

    // Check liquidity increased and INCREASE event created
    assert.fieldEquals('Position', tokenId.toString(), 'liquidity', '1500')
    const increaseEventId = getExpectedEventId(tokenId, 'INCREASE')
    assert.fieldEquals('PositionEvent', increaseEventId, 'type', 'INCREASE')
    assert.fieldEquals('PositionEvent', increaseEventId, 'amount', '500')

    // 3. Remove Liquidity: DecreaseLiquidity → DECREASE event
    const removeLiquidityEvent = createDecreaseLiquidityEvent(
      tokenId,
      BigInt.fromI32(300),
      BigInt.fromI32(30),
      BigInt.fromI32(60)
    )
    handleDecreaseLiquidity(removeLiquidityEvent)

    // Check liquidity decreased and DECREASE event created
    assert.fieldEquals('Position', tokenId.toString(), 'liquidity', '1200')
    const decreaseEventId = getExpectedEventId(tokenId, 'DECREASE')
    assert.fieldEquals('PositionEvent', decreaseEventId, 'type', 'DECREASE')
    assert.fieldEquals('PositionEvent', decreaseEventId, 'amount', '300')

    // 4. Transfer NFT: Transfer(user → user) → TRANSFER event
    const transferEvent = createTransferEvent(user1, user2, tokenId)
    handleTransfer(transferEvent)

    // Check owner changed and TRANSFER event created
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'owner',
      user2.toHexString()
    )
    // Note: This TRANSFER event will overwrite the previous one due to same ID
    // In a real scenario, events would have different transaction hashes
    const userTransferEventId = getExpectedEventId(tokenId, 'TRANSFER')
    assert.fieldEquals('PositionEvent', userTransferEventId, 'type', 'TRANSFER')
    assert.fieldEquals(
      'PositionEvent',
      userTransferEventId,
      'sender',
      user1.toHexString()
    )
    assert.fieldEquals(
      'PositionEvent',
      userTransferEventId,
      'recipient',
      user2.toHexString()
    )

    // 5. Burn NFT: Transfer(user → 0x000) → TRANSFER event
    const burnEvent = createTransferEvent(user2, Address.zero(), tokenId)
    handleTransfer(burnEvent)

    // Check owner is now zero address and final TRANSFER event created
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'owner',
      Address.zero().toHexString()
    )
    const burnEventId = getExpectedEventId(tokenId, 'TRANSFER')
    assert.fieldEquals('PositionEvent', burnEventId, 'type', 'TRANSFER')
    assert.fieldEquals(
      'PositionEvent',
      burnEventId,
      'sender',
      user2.toHexString()
    )
    assert.fieldEquals(
      'PositionEvent',
      burnEventId,
      'recipient',
      Address.zero().toHexString()
    )
  })
})
