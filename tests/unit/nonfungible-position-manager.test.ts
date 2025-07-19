import {
  assert,
  describe,
  test,
  clearStore,
  beforeAll,
  afterAll,
  createMockedFunction,
  newMockEvent
} from "matchstick-as/assembly/index"
import { Address, BigInt } from "@graphprotocol/graph-ts"
import { DecreaseLiquidity, IncreaseLiquidity, Transfer } from "../../generated/NonfungiblePositionManager/NonfungiblePositionManager"
import { handleDecreaseLiquidity, handleIncreaseLiquidity, handleTransfer } from "../../src/nonfungible-position-manager"

// Import test helpers
import {
  TRACKED_POOL,
  UNTRACKED_POOL,
  FACTORY_ADDRESS,
  CONTRACT_ADDRESS,
  TOKEN0,
  TOKEN1,
  FEE,
  USER_1,
  setupTrackedPoolMocks,
  setupUntrackedPoolMocks,
  createIncreaseLiquidityEvent,
  createDecreaseLiquidityEvent,
  createTransferEvent,
  getExpectedEventId,
  beforeEach as testBeforeEach
} from "../helpers"

// All helper functions now imported from ../helpers

describe("Nonfungible Position Manager", () => {
  beforeAll(() => {
    // Setup any global mocks if needed
  })

  afterAll(() => {
    clearStore()
  })

  describe("Pool Filtering", () => {
    test("handleIncreaseLiquidity - tracked pool creates position with pool field", () => {
      // Setup
      let tokenId = BigInt.fromI32(1001)
      let liquidity = BigInt.fromI32(1000)
      let amount0 = BigInt.fromI32(100)
      let amount1 = BigInt.fromI32(200)
      let owner = Address.fromString("0x1234567890123456789012345678901234567890")

      // Setup mocks for tracked pool
      setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, owner)

      // Create mock event
      let mockEvent = createIncreaseLiquidityEvent(tokenId, liquidity, amount0, amount1)

      // Execute
      handleIncreaseLiquidity(mockEvent)

      // Assert position exists with correct pool
      assert.fieldEquals("Position", tokenId.toString(), "pool", TRACKED_POOL.toHexString())
      assert.fieldEquals("Position", tokenId.toString(), "owner", owner.toHexString())
      assert.fieldEquals("Position", tokenId.toString(), "liquidity", liquidity.toString())

      // Assert MINT event was created
      let expectedEventId = getExpectedEventId(tokenId, "MINT")
      assert.fieldEquals("PositionEvent", expectedEventId, "type", "MINT")
      assert.fieldEquals("PositionEvent", expectedEventId, "amount", liquidity.toString())
      assert.fieldEquals("PositionEvent", expectedEventId, "amount0", amount0.toString())
      assert.fieldEquals("PositionEvent", expectedEventId, "amount1", amount1.toString())
    })

    test("handleIncreaseLiquidity - untracked pool ignores position (no entities created)", () => {
      // Setup
      let tokenId = BigInt.fromI32(1002)
      let liquidity = BigInt.fromI32(1000)
      let amount0 = BigInt.fromI32(100)
      let amount1 = BigInt.fromI32(200)
      let owner = Address.fromString("0x1234567890123456789012345678901234567890")

      // Setup mocks for untracked pool
      setupUntrackedPoolMocks(CONTRACT_ADDRESS, tokenId, owner)

      // Create mock event
      let mockEvent = createIncreaseLiquidityEvent(tokenId, liquidity, amount0, amount1)

      // Execute
      handleIncreaseLiquidity(mockEvent)

      // Assert NO position was created
      assert.notInStore("Position", tokenId.toString())

      // Assert NO event was created
      let eventId = getExpectedEventId(tokenId, "MINT")
      assert.notInStore("PositionEvent", eventId)
    })

    test("handleDecreaseLiquidity - untracked pool ignores existing position", () => {
      // Setup
      let tokenId = BigInt.fromI32(1003)
      let liquidity = BigInt.fromI32(500)
      let amount0 = BigInt.fromI32(50)
      let amount1 = BigInt.fromI32(100)
      let owner = Address.fromString("0x1234567890123456789012345678901234567890")

      // Setup mocks for untracked pool
      setupUntrackedPoolMocks(CONTRACT_ADDRESS, tokenId, owner)

      // Create mock event
      let mockEvent = createDecreaseLiquidityEvent(tokenId, liquidity, amount0, amount1)

      // Execute
      handleDecreaseLiquidity(mockEvent)

      // Assert NO position was created
      assert.notInStore("Position", tokenId.toString())

      // Assert NO event was created
      let eventId = getExpectedEventId(tokenId, "DECREASE")
      assert.notInStore("PositionEvent", eventId)
    })

    test("handleTransfer - untracked pool ignores NFT mint", () => {
      // Setup
      let tokenId = BigInt.fromI32(1004)
      let from = Address.zero()
      let to = Address.fromString("0x1234567890123456789012345678901234567890")

      // Setup mocks for untracked pool
      setupUntrackedPoolMocks(CONTRACT_ADDRESS, tokenId, to)

      // Create mock transfer event
      let mockEvent = createTransferEvent(from, to, tokenId)

      // Execute
      handleTransfer(mockEvent)

      // Assert NO position was created
      assert.notInStore("Position", tokenId.toString())

      // Assert NO transfer event was created
      let eventId = getExpectedEventId(tokenId, "TRANSFER")
      assert.notInStore("PositionEvent", eventId)
    })

    test("subsequent calls use cached pool check for tracked position", () => {
      // Setup - create tracked position first
      let tokenId = BigInt.fromI32(1005)
      let initialLiquidity = BigInt.fromI32(1000)
      let owner = Address.fromString("0x1234567890123456789012345678901234567890")

      // Setup mocks for tracked pool (first call)
      setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, owner)

      // Create position with IncreaseLiquidity
      let mockIncreaseEvent = createIncreaseLiquidityEvent(tokenId, initialLiquidity, BigInt.fromI32(100), BigInt.fromI32(200))
      handleIncreaseLiquidity(mockIncreaseEvent)

      // Verify position exists with pool field
      assert.fieldEquals("Position", tokenId.toString(), "pool", TRACKED_POOL.toHexString())

      // Now test subsequent decrease (should work without factory calls since position exists)
      let decreaseLiquidity = BigInt.fromI32(300)
      let mockDecreaseEvent = createDecreaseLiquidityEvent(tokenId, decreaseLiquidity, BigInt.fromI32(30), BigInt.fromI32(60))

      // Execute decrease
      handleDecreaseLiquidity(mockDecreaseEvent)

      // Assert position liquidity decreased (proving it processed the tracked position)
      let expectedLiquidity = initialLiquidity.minus(decreaseLiquidity)
      assert.fieldEquals("Position", tokenId.toString(), "liquidity", expectedLiquidity.toString())

      // Assert decrease event was created
      let expectedEventId = getExpectedEventId(tokenId, "DECREASE")
      assert.fieldEquals("PositionEvent", expectedEventId, "type", "DECREASE")
    })
  })

  test("handleIncreaseLiquidity creates position and event", () => {
    // Setup
    let tokenId = BigInt.fromI32(1)
    let liquidity = BigInt.fromI32(1000)
    let amount0 = BigInt.fromI32(100)
    let amount1 = BigInt.fromI32(200)
    let owner = Address.fromString("0x1234567890123456789012345678901234567890")

    // Setup mocks for tracked pool
    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, owner)

    // Create mock event
    let mockEvent = createIncreaseLiquidityEvent(tokenId, liquidity, amount0, amount1)

    // Execute
    handleIncreaseLiquidity(mockEvent)

    // Assert position exists with pool field
    assert.fieldEquals("Position", tokenId.toString(), "pool", TRACKED_POOL.toHexString())
    assert.fieldEquals("Position", tokenId.toString(), "owner", owner.toHexString())
    assert.fieldEquals("Position", tokenId.toString(), "liquidity", liquidity.toString())

    // Assert MINT event was created
    let expectedEventId = getExpectedEventId(tokenId, "MINT")
    assert.fieldEquals("PositionEvent", expectedEventId, "type", "MINT")
    assert.fieldEquals("PositionEvent", expectedEventId, "amount", liquidity.toString())
    assert.fieldEquals("PositionEvent", expectedEventId, "amount0", amount0.toString())
    assert.fieldEquals("PositionEvent", expectedEventId, "amount1", amount1.toString())
  })

  test("handleDecreaseLiquidity updates position and creates event", () => {
    // Setup - first create a position
    let tokenId = BigInt.fromI32(2)
    let initialLiquidity = BigInt.fromI32(1000)
    let decreaseLiquidity = BigInt.fromI32(500)
    let amount0 = BigInt.fromI32(50)
    let amount1 = BigInt.fromI32(100)
    let owner = Address.fromString("0x1234567890123456789012345678901234567890")

    // Setup mocks for tracked pool
    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, owner)

    // Create position first with IncreaseLiquidity
    let mockIncreaseEvent = createIncreaseLiquidityEvent(tokenId, initialLiquidity, BigInt.fromI32(100), BigInt.fromI32(200))
    handleIncreaseLiquidity(mockIncreaseEvent)

    // Now create decrease event
    let mockDecreaseEvent = createDecreaseLiquidityEvent(tokenId, decreaseLiquidity, amount0, amount1)

    // Execute
    handleDecreaseLiquidity(mockDecreaseEvent)

    // Assert position liquidity decreased
    let expectedLiquidity = initialLiquidity.minus(decreaseLiquidity)
    assert.fieldEquals("Position", tokenId.toString(), "liquidity", expectedLiquidity.toString())

    // Assert decrease event was created
    let expectedEventId = getExpectedEventId(tokenId, "DECREASE")
    assert.fieldEquals("PositionEvent", expectedEventId, "type", "DECREASE")
    assert.fieldEquals("PositionEvent", expectedEventId, "amount", decreaseLiquidity.toString())
  })

  test("handleTransfer from zero address creates position", () => {
    // Setup
    let tokenId = BigInt.fromI32(3)
    let from = Address.zero()
    let to = Address.fromString("0x1234567890123456789012345678901234567890")

    // Setup mocks for tracked pool
    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, to)

    // Create mock transfer event
    let mockEvent = createTransferEvent(from, to, tokenId)

    // Execute
    handleTransfer(mockEvent)

    // Assert position exists with correct owner and pool
    assert.fieldEquals("Position", tokenId.toString(), "pool", TRACKED_POOL.toHexString())
    assert.fieldEquals("Position", tokenId.toString(), "owner", to.toHexString())

    // Assert transfer event was created
    let expectedEventId = getExpectedEventId(tokenId, "TRANSFER")
    assert.fieldEquals("PositionEvent", expectedEventId, "type", "TRANSFER")
  })

  test("handleTransfer to zero address (burn) updates position", () => {
    // Setup - first create a position
    let tokenId = BigInt.fromI32(4)
    let owner = Address.fromString("0x1234567890123456789012345678901234567890")

    // Setup mocks for tracked pool
    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, owner)

    // Create position first
    let mockIncreaseEvent = createIncreaseLiquidityEvent(tokenId, BigInt.fromI32(1000), BigInt.fromI32(100), BigInt.fromI32(200))
    handleIncreaseLiquidity(mockIncreaseEvent)

    // Now create burn transfer
    let mockTransferEvent = createTransferEvent(owner, Address.zero(), tokenId)

    // Execute
    handleTransfer(mockTransferEvent)

    // Assert position owner is now zero address
    assert.fieldEquals("Position", tokenId.toString(), "owner", Address.zero().toHexString())

    // Assert transfer event was created
    let expectedEventId = getExpectedEventId(tokenId, "TRANSFER")
    assert.fieldEquals("PositionEvent", expectedEventId, "type", "TRANSFER")
  })

  test("follows complete position lifecycle as specified in README", () => {
    let tokenId = BigInt.fromI32(100)
    let user1 = Address.fromString("0x3333333333333333333333333333333333333333")
    let user2 = Address.fromString("0x4444444444444444444444444444444444444444")

    // Setup mocks for tracked pool
    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, user1)

    // 1. NFT Mint: Transfer(0x000 → user) → Creates position + TRANSFER event
    // But first IncreaseLiquidity fires (adds initial liquidity) → MINT event
    let mintLiquidityEvent = createIncreaseLiquidityEvent(tokenId, BigInt.fromI32(1000), BigInt.fromI32(100), BigInt.fromI32(200))
    handleIncreaseLiquidity(mintLiquidityEvent)

    // Check position was created and MINT event exists
    assert.fieldEquals("Position", tokenId.toString(), "pool", TRACKED_POOL.toHexString())
    assert.fieldEquals("Position", tokenId.toString(), "owner", user1.toHexString())
    assert.fieldEquals("Position", tokenId.toString(), "liquidity", "1000")
    
    // Assert MINT event was created
    let mintEventId = getExpectedEventId(tokenId, "MINT")
    assert.fieldEquals("PositionEvent", mintEventId, "type", "MINT")
    assert.fieldEquals("PositionEvent", mintEventId, "amount", "1000")
    
    // Then Transfer event fires (NFT mint)
    let transferMintEvent = createTransferEvent(Address.zero(), user1, tokenId)
    handleTransfer(transferMintEvent)

    // Assert TRANSFER event was created for the mint
    let transferMintEventId = getExpectedEventId(tokenId, "TRANSFER")
    assert.fieldEquals("PositionEvent", transferMintEventId, "type", "TRANSFER")
    assert.fieldEquals("PositionEvent", transferMintEventId, "sender", Address.zero().toHexString())
    assert.fieldEquals("PositionEvent", transferMintEventId, "recipient", user1.toHexString())

    // 2. Add Liquidity: IncreaseLiquidity → INCREASE event (subsequent times)
    let addLiquidityEvent = createIncreaseLiquidityEvent(tokenId, BigInt.fromI32(500), BigInt.fromI32(50), BigInt.fromI32(100))
    handleIncreaseLiquidity(addLiquidityEvent)

    // Check liquidity increased and INCREASE event created
    assert.fieldEquals("Position", tokenId.toString(), "liquidity", "1500")
    let increaseEventId = getExpectedEventId(tokenId, "INCREASE")
    assert.fieldEquals("PositionEvent", increaseEventId, "type", "INCREASE")
    assert.fieldEquals("PositionEvent", increaseEventId, "amount", "500")

    // 3. Remove Liquidity: DecreaseLiquidity → DECREASE event
    let removeLiquidityEvent = createDecreaseLiquidityEvent(tokenId, BigInt.fromI32(300), BigInt.fromI32(30), BigInt.fromI32(60))
    handleDecreaseLiquidity(removeLiquidityEvent)

    // Check liquidity decreased and DECREASE event created
    assert.fieldEquals("Position", tokenId.toString(), "liquidity", "1200")
    let decreaseEventId = getExpectedEventId(tokenId, "DECREASE")
    assert.fieldEquals("PositionEvent", decreaseEventId, "type", "DECREASE")
    assert.fieldEquals("PositionEvent", decreaseEventId, "amount", "300")

    // 4. Transfer NFT: Transfer(user → user) → TRANSFER event
    let transferEvent = createTransferEvent(user1, user2, tokenId)
    handleTransfer(transferEvent)

    // Check owner changed and TRANSFER event created
    assert.fieldEquals("Position", tokenId.toString(), "owner", user2.toHexString())
    // Note: This TRANSFER event will overwrite the previous one due to same ID
    // In a real scenario, events would have different transaction hashes
    let userTransferEventId = getExpectedEventId(tokenId, "TRANSFER")
    assert.fieldEquals("PositionEvent", userTransferEventId, "type", "TRANSFER")
    assert.fieldEquals("PositionEvent", userTransferEventId, "sender", user1.toHexString())
    assert.fieldEquals("PositionEvent", userTransferEventId, "recipient", user2.toHexString())

    // 5. Burn NFT: Transfer(user → 0x000) → TRANSFER event
    let burnEvent = createTransferEvent(user2, Address.zero(), tokenId)
    handleTransfer(burnEvent)

    // Check owner is now zero address and final TRANSFER event created
    assert.fieldEquals("Position", tokenId.toString(), "owner", Address.zero().toHexString())
    let burnEventId = getExpectedEventId(tokenId, "TRANSFER")
    assert.fieldEquals("PositionEvent", burnEventId, "type", "TRANSFER")
    assert.fieldEquals("PositionEvent", burnEventId, "sender", user2.toHexString())
    assert.fieldEquals("PositionEvent", burnEventId, "recipient", Address.zero().toHexString())
  })
})
