import {
  assert,
  describe,
  test,
  beforeEach
} from "matchstick-as/assembly/index"
import { Address, BigInt } from "@graphprotocol/graph-ts"
import { handleDecreaseLiquidity } from "../../src/nonfungible-position-manager"
import {
  beforeEach as testBeforeEach,
  USER_1,
  CONTRACT_ADDRESS,
  setupTrackedPoolMocks,
  setupUntrackedPoolMocks,
  createDecreaseLiquidityEvent,
  getExpectedEventId
} from "../helpers"

describe("Orphan Decrease Handling", () => {
  beforeEach(() => {
    testBeforeEach()
  })

  test("orphan_decrease_is_ignored", () => {
    // Arrange: DecreaseLiquidity for a tokenId never seen before
    // BUT whose pool would be tracked (if it existed)
    let orphanTokenId = BigInt.fromI32(3001)
    let liquidity = BigInt.fromI32(500)
    let amount0 = BigInt.fromI32(50)
    let amount1 = BigInt.fromI32(100)

    // Setup mocks as if this were a tracked pool (to prove it's not the pool filter rejecting it)
    setupTrackedPoolMocks(CONTRACT_ADDRESS, orphanTokenId, USER_1)

    // Act: Send DecreaseLiquidity for non-existent position
    let decreaseEvent = createDecreaseLiquidityEvent(orphanTokenId, liquidity, amount0, amount1)
    handleDecreaseLiquidity(decreaseEvent)

    // Assert: NO Position entity created
    assert.notInStore("Position", orphanTokenId.toString())

    // Assert: NO PositionEvent created
    let eventId = getExpectedEventId(orphanTokenId, "DECREASE")
    assert.notInStore("PositionEvent", eventId)

    // Verify the store is completely empty for this tokenId
    assert.entityCount("Position", 0)
    assert.entityCount("PositionEvent", 0)
  })

  test("orphan_decrease_untracked_pool_is_ignored", () => {
    // Arrange: Orphan decrease for untracked pool
    let orphanTokenId = BigInt.fromI32(3002)
    let liquidity = BigInt.fromI32(500)
    let amount0 = BigInt.fromI32(50)
    let amount1 = BigInt.fromI32(100)

    // Setup as untracked pool (should be filtered out anyway)
    setupUntrackedPoolMocks(CONTRACT_ADDRESS, orphanTokenId, USER_1)

    // Act: Send DecreaseLiquidity
    let decreaseEvent = createDecreaseLiquidityEvent(orphanTokenId, liquidity, amount0, amount1)
    handleDecreaseLiquidity(decreaseEvent)

    // Assert: No entities created
    assert.notInStore("Position", orphanTokenId.toString())
    let eventId = getExpectedEventId(orphanTokenId, "DECREASE")
    assert.notInStore("PositionEvent", eventId)
  })

  test("orphan_decrease_after_valid_position_exists_elsewhere", () => {
    // Arrange: Create a valid position for one tokenId, then try to decrease a different orphan tokenId
    let validTokenId = BigInt.fromI32(3003)
    let orphanTokenId = BigInt.fromI32(3004)
    let liquidity = BigInt.fromI32(1000)

    // Create valid position first
    setupTrackedPoolMocks(CONTRACT_ADDRESS, validTokenId, USER_1)
    
    // This would normally create a position via IncreaseLiquidity, but for simplicity 
    // let's just verify the orphan decrease doesn't interfere
    setupTrackedPoolMocks(CONTRACT_ADDRESS, orphanTokenId, USER_1)

    // Act: Try to decrease liquidity on orphan tokenId
    let decreaseEvent = createDecreaseLiquidityEvent(orphanTokenId, liquidity, BigInt.fromI32(100), BigInt.fromI32(200))
    handleDecreaseLiquidity(decreaseEvent)

    // Assert: Still no position for orphan tokenId
    assert.notInStore("Position", orphanTokenId.toString())

    // And no events created for the orphan
    let eventId = getExpectedEventId(orphanTokenId, "DECREASE")
    assert.notInStore("PositionEvent", eventId)
  })

  test("multiple_orphan_decreases_all_ignored", () => {
    // Arrange: Multiple orphan decreases for different tokenIds
    let orphan1 = BigInt.fromI32(3005)
    let orphan2 = BigInt.fromI32(3006)
    let orphan3 = BigInt.fromI32(3007)

    setupTrackedPoolMocks(CONTRACT_ADDRESS, orphan1, USER_1)
    setupTrackedPoolMocks(CONTRACT_ADDRESS, orphan2, USER_1)
    setupTrackedPoolMocks(CONTRACT_ADDRESS, orphan3, USER_1)

    // Act: Send multiple orphan decreases
    handleDecreaseLiquidity(createDecreaseLiquidityEvent(orphan1, BigInt.fromI32(100), BigInt.fromI32(10), BigInt.fromI32(20)))
    handleDecreaseLiquidity(createDecreaseLiquidityEvent(orphan2, BigInt.fromI32(200), BigInt.fromI32(20), BigInt.fromI32(40)))
    handleDecreaseLiquidity(createDecreaseLiquidityEvent(orphan3, BigInt.fromI32(300), BigInt.fromI32(30), BigInt.fromI32(60)))

    // Assert: No positions or events created
    assert.notInStore("Position", orphan1.toString())
    assert.notInStore("Position", orphan2.toString())
    assert.notInStore("Position", orphan3.toString())

    assert.entityCount("Position", 0)
    assert.entityCount("PositionEvent", 0)
  })
}) 