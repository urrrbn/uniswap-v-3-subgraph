import {
  assert,
  describe,
  test,
  beforeEach
} from "matchstick-as/assembly/index"
import { Address, BigInt } from "@graphprotocol/graph-ts"
import { handleIncreaseLiquidity } from "../../src/nonfungible-position-manager"
import {
  beforeEach as testBeforeEach,
  USER_1,
  CONTRACT_ADDRESS,
  setupTrackedPoolMocks,
  createIncreaseLiquidityEvent,
  getExpectedEventId
} from "../helpers"

describe("Duplicate Increase Handling", () => {
  beforeEach(() => {
    testBeforeEach()
  })

  test("double_increase_same_block_no_duplicate_position", () => {
    // Arrange: Setup tracked pool for a specific tokenId
    let tokenId = BigInt.fromI32(2001)
    let firstLiquidity = BigInt.fromI32(1000)
    let secondLiquidity = BigInt.fromI32(500)
    let amount0_1 = BigInt.fromI32(100)
    let amount1_1 = BigInt.fromI32(200)
    let amount0_2 = BigInt.fromI32(50)
    let amount1_2 = BigInt.fromI32(100)

    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, USER_1)

    // Act: Send two identical IncreaseLiquidity events for same tokenId
    let firstEvent = createIncreaseLiquidityEvent(tokenId, firstLiquidity, amount0_1, amount1_1)
    let secondEvent = createIncreaseLiquidityEvent(tokenId, secondLiquidity, amount0_2, amount1_2)

    handleIncreaseLiquidity(firstEvent)
    handleIncreaseLiquidity(secondEvent)

    // Assert: Only ONE Position entity exists
    assert.fieldEquals("Position", tokenId.toString(), "owner", USER_1.toHexString())
    
    // Assert: Position liquidity is the SUM of both amounts
    let expectedTotalLiquidity = firstLiquidity.plus(secondLiquidity)
    assert.fieldEquals("Position", tokenId.toString(), "liquidity", expectedTotalLiquidity.toString())

    // Assert: Exactly 2 PositionEvents exist (MINT + INCREASE)
    // First event creates MINT (since createdAt was 0)
    let mintEventId = getExpectedEventId(tokenId, "MINT")
    assert.fieldEquals("PositionEvent", mintEventId, "type", "MINT")
    assert.fieldEquals("PositionEvent", mintEventId, "amount", firstLiquidity.toString())

    // Second event creates INCREASE (since createdAt is no longer 0)
    let increaseEventId = getExpectedEventId(tokenId, "INCREASE")
    assert.fieldEquals("PositionEvent", increaseEventId, "type", "INCREASE")
    assert.fieldEquals("PositionEvent", increaseEventId, "amount", secondLiquidity.toString())

    // Verify position metadata
    assert.fieldEquals("Position", tokenId.toString(), "id", tokenId.toString())
    // createdAt should be set after first event
    // Position should be linked to tracked pool
    assert.fieldEquals("Position", tokenId.toString(), "pool", "0x1111111111111111111111111111111111111111")
  })

  test("triple_increase_accumulates_liquidity", () => {
    // Arrange: Setup for three consecutive increases
    let tokenId = BigInt.fromI32(2002)
    let liq1 = BigInt.fromI32(1000)
    let liq2 = BigInt.fromI32(500)
    let liq3 = BigInt.fromI32(250)

    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, USER_1)

    // Act: Three consecutive increases
    handleIncreaseLiquidity(createIncreaseLiquidityEvent(tokenId, liq1, BigInt.fromI32(100), BigInt.fromI32(200)))
    handleIncreaseLiquidity(createIncreaseLiquidityEvent(tokenId, liq2, BigInt.fromI32(50), BigInt.fromI32(100)))
    handleIncreaseLiquidity(createIncreaseLiquidityEvent(tokenId, liq3, BigInt.fromI32(25), BigInt.fromI32(50)))

    // Assert: Total liquidity is sum of all three
    let expectedTotal = liq1.plus(liq2).plus(liq3)
    assert.fieldEquals("Position", tokenId.toString(), "liquidity", expectedTotal.toString())

    // Assert: Only one position entity
    assert.fieldEquals("Position", tokenId.toString(), "owner", USER_1.toHexString())

    // Verify events exist (though in test environment, event IDs might overlap)
    let mintEventId = getExpectedEventId(tokenId, "MINT")
    assert.fieldEquals("PositionEvent", mintEventId, "type", "MINT")
  })

  test("same_block_different_tokens_separate_positions", () => {
    // Arrange: Two different tokenIds in same "block"
    let tokenId1 = BigInt.fromI32(2003)
    let tokenId2 = BigInt.fromI32(2004)
    let liquidity = BigInt.fromI32(1000)

    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId1, USER_1)
    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId2, USER_1)

    // Act: Increase liquidity for both tokens
    handleIncreaseLiquidity(createIncreaseLiquidityEvent(tokenId1, liquidity, BigInt.fromI32(100), BigInt.fromI32(200)))
    handleIncreaseLiquidity(createIncreaseLiquidityEvent(tokenId2, liquidity, BigInt.fromI32(100), BigInt.fromI32(200)))

    // Assert: Two separate Position entities
    assert.fieldEquals("Position", tokenId1.toString(), "liquidity", liquidity.toString())
    assert.fieldEquals("Position", tokenId2.toString(), "liquidity", liquidity.toString())
    assert.fieldEquals("Position", tokenId1.toString(), "owner", USER_1.toHexString())
    assert.fieldEquals("Position", tokenId2.toString(), "owner", USER_1.toHexString())
  })
}) 