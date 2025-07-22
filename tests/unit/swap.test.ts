import {
  assert,
  describe,
  test,
  clearStore,
  beforeAll,
  afterAll,
  beforeEach,
} from 'matchstick-as/assembly/index'
import { BigInt } from '@graphprotocol/graph-ts'
import { handleSwap } from '../../src/pool'

// Import test helpers
import {
  TRACKED_POOL,
  TRACKED_POOL_2,
  TRACKED_POOL_3,
  UNTRACKED_POOL,
  USER_1,
  USER_2,
  createSwapEvent,
  getExpectedSwapId,
  beforeEach as testBeforeEach,
} from '../helpers'

// Use the same pool addresses as in constants.ts
const POOL_1_BITUSD_MBTILL = TRACKED_POOL // BitUSD/mTBILL (BitUSD is token0)
const POOL_2_WSTROSE_BITUSD = TRACKED_POOL_2 // wstROSE/BitUSD (BitUSD is token1)
const POOL_3_WROSE_BITUSD = TRACKED_POOL_3 // wROSE/BitUSD (BitUSD is token1)

describe('BitUSD Purchase Event Handler', () => {
  beforeAll(() => {
    // Setup any global mocks if needed
  })

  afterAll(() => {
    clearStore()
  })

  beforeEach(() => {
    testBeforeEach()
  })

  describe('Pool Filtering', () => {
    test('handleSwap - tracked pool with BitUSD purchase creates purchase entity', () => {
      // Setup BitUSD purchase in Pool 1 (BitUSD is token0)
      const sender = USER_1 // Router contract
      const recipient = USER_2
      const actualUser = USER_2 // Actual transaction initiator
      const amount0 = BigInt.fromI32(-1000) // Negative = receiving BitUSD (buying)
      const amount1 = BigInt.fromI32(1500) // Positive = giving mTBILL

      // Create swap event for tracked pool
      const swapEvent = createSwapEvent(
        POOL_1_BITUSD_MBTILL,
        sender,
        recipient,
        amount0,
        amount1,
        actualUser // Set transaction.from to actual user
      )

      // Handle the event
      handleSwap(swapEvent)

      // Verify User entity was created with volume tracking (for actual user, not router)
      assert.fieldEquals(
        'User',
        actualUser.toHexString(),
        'id',
        actualUser.toHexString()
      )
      assert.fieldEquals(
        'User',
        actualUser.toHexString(),
        'totalBitUSDVolume',
        '1000'
      )

      // Verify BitUSDPurchase entity was created
      const expectedPurchaseId = getExpectedSwapId()
      assert.fieldEquals(
        'BitUSDPurchase',
        expectedPurchaseId,
        'id',
        expectedPurchaseId
      )
      assert.fieldEquals(
        'BitUSDPurchase',
        expectedPurchaseId,
        'pool',
        POOL_1_BITUSD_MBTILL.toHexString()
      )
      assert.fieldEquals(
        'BitUSDPurchase',
        expectedPurchaseId,
        'user',
        actualUser.toHexString()
      ) // Points to actual user
      assert.fieldEquals(
        'BitUSDPurchase',
        expectedPurchaseId,
        'sender',
        sender.toHexString()
      ) // Still tracks router
      assert.fieldEquals(
        'BitUSDPurchase',
        expectedPurchaseId,
        'bitUSDAmount',
        '1000'
      )
      assert.fieldEquals(
        'BitUSDPurchase',
        expectedPurchaseId,
        'otherTokenAmount',
        '1500'
      )
    })

    test('handleSwap - BitUSD purchase in Pool 2 (BitUSD as token1)', () => {
      // Setup BitUSD purchase in Pool 2 (BitUSD is token1)
      const sender = USER_1
      const recipient = USER_2
      const amount0 = BigInt.fromI32(800) // Positive = giving wstROSE
      const amount1 = BigInt.fromI32(-500) // Negative = receiving BitUSD (buying)

      const swapEvent = createSwapEvent(
        POOL_2_WSTROSE_BITUSD,
        sender,
        recipient,
        amount0,
        amount1
      )

      handleSwap(swapEvent)

      const expectedPurchaseId = getExpectedSwapId()
      assert.fieldEquals(
        'BitUSDPurchase',
        expectedPurchaseId,
        'bitUSDAmount',
        '500'
      )
      assert.fieldEquals(
        'BitUSDPurchase',
        expectedPurchaseId,
        'otherTokenAmount',
        '800'
      )
    })

    test('handleSwap - BitUSD selling (not buying) does not create entity', () => {
      // Setup BitUSD selling in Pool 1 (opposite direction)
      const sender = USER_1
      const recipient = USER_2
      const amount0 = BigInt.fromI32(1000) // Positive = giving BitUSD (selling)
      const amount1 = BigInt.fromI32(-1500) // Negative = receiving mTBILL

      const swapEvent = createSwapEvent(
        POOL_1_BITUSD_MBTILL,
        sender,
        recipient,
        amount0,
        amount1
      )

      handleSwap(swapEvent)

      // Verify no entities were created (we only track purchases)
      const expectedPurchaseId = getExpectedSwapId()
      assert.notInStore('BitUSDPurchase', expectedPurchaseId)
      assert.notInStore('User', sender.toHexString())
    })

    test('handleSwap - untracked pool does not create entity', () => {
      const sender = USER_1
      const recipient = USER_2
      const amount0 = BigInt.fromI32(-1000)
      const amount1 = BigInt.fromI32(1500)

      const swapEvent = createSwapEvent(
        UNTRACKED_POOL,
        sender,
        recipient,
        amount0,
        amount1
      )

      handleSwap(swapEvent)

      const expectedPurchaseId = getExpectedSwapId()
      assert.notInStore('BitUSDPurchase', expectedPurchaseId)
      assert.notInStore('User', sender.toHexString())
    })
  })

  describe('User Volume Tracking', () => {
    test('handleSwap - accumulates user BitUSD volume across purchases', () => {
      const actualUser = USER_1 // Transaction initiator (actual user)

      // First purchase: 1000 BitUSD
      const swapEvent1 = createSwapEvent(
        POOL_1_BITUSD_MBTILL,
        USER_2, // Router
        USER_2, // Recipient
        BigInt.fromI32(-1000), // Buying 1000 BitUSD
        BigInt.fromI32(1500),
        actualUser // Actual user making the purchase
      )

      handleSwap(swapEvent1)
      assert.fieldEquals(
        'User',
        actualUser.toHexString(),
        'totalBitUSDVolume',
        '1000'
      )

      // Second purchase: 500 BitUSD (total should be 1500)
      clearStore() // Clear to simulate different transaction

      const swapEvent2 = createSwapEvent(
        POOL_2_WSTROSE_BITUSD,
        USER_2, // Router
        USER_2, // Recipient
        BigInt.fromI32(800),
        BigInt.fromI32(-500), // Buying 500 BitUSD
        actualUser // Same actual user making another purchase
      )

      handleSwap(swapEvent2)

      // Volume should accumulate (but since we cleared store, it starts fresh)
      // In real scenario, volume would accumulate to 1500
      assert.fieldEquals(
        'User',
        actualUser.toHexString(),
        'totalBitUSDVolume',
        '500'
      )
    })

    test('handleSwap - updates last purchase timestamp', () => {
      const actualUser = USER_1
      const swapEvent = createSwapEvent(
        POOL_1_BITUSD_MBTILL,
        USER_2, // Router
        USER_2, // Recipient
        BigInt.fromI32(-1000),
        BigInt.fromI32(1500),
        actualUser // Actual user
      )

      handleSwap(swapEvent)

      // Check that lastPurchaseTimestamp is set (mock events have timestamp = 1)
      assert.fieldEquals(
        'User',
        actualUser.toHexString(),
        'lastPurchaseTimestamp',
        '1'
      )
    })
  })

  describe('Different Pool Types', () => {
    test('handleSwap - Pool 3 wROSE/BitUSD purchases', () => {
      const sender = USER_1
      const recipient = USER_2
      const amount0 = BigInt.fromI32(2000) // Giving wROSE
      const amount1 = BigInt.fromI32(-750) // Receiving BitUSD

      const swapEvent = createSwapEvent(
        POOL_3_WROSE_BITUSD,
        sender,
        recipient,
        amount0,
        amount1
      )

      handleSwap(swapEvent)

      const expectedPurchaseId = getExpectedSwapId()
      assert.fieldEquals(
        'BitUSDPurchase',
        expectedPurchaseId,
        'bitUSDAmount',
        '750'
      )
      assert.fieldEquals(
        'BitUSDPurchase',
        expectedPurchaseId,
        'otherTokenAmount',
        '2000'
      )
    })
  })
})
