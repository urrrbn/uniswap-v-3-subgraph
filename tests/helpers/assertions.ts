import { assert } from "matchstick-as/assembly/index"
import { Address, BigInt } from "@graphprotocol/graph-ts"
import { getExpectedEventId } from "./events"

// Test validation helpers for comprehensive testing
export function validatePositionLifecycle(
  tokenId: BigInt, 
  expectedOwner: Address, 
  expectedPool: Address, 
  expectedLiquidity: BigInt
): void {
  // Validate position entity fields
  assert.fieldEquals("Position", tokenId.toString(), "id", tokenId.toString())
  assert.fieldEquals("Position", tokenId.toString(), "owner", expectedOwner.toHexString())
  assert.fieldEquals("Position", tokenId.toString(), "pool", expectedPool.toHexString())
  assert.fieldEquals("Position", tokenId.toString(), "liquidity", expectedLiquidity.toString())
}

export function validateEventCreation(
  tokenId: BigInt,
  eventType: string,
  expectedAmount: BigInt,
  sender: Address | null = null,
  recipient: Address | null = null
): void {
  let eventId = getExpectedEventId(tokenId, eventType)
  
  // Validate core event fields
  assert.fieldEquals("PositionEvent", eventId, "type", eventType)
  assert.fieldEquals("PositionEvent", eventId, "position", tokenId.toString())
  assert.fieldEquals("PositionEvent", eventId, "amount", expectedAmount.toString())
  
  // Validate transfer-specific fields if provided
  if (sender !== null) {
    assert.fieldEquals("PositionEvent", eventId, "sender", sender.toHexString())
  }
  if (recipient !== null) {
    assert.fieldEquals("PositionEvent", eventId, "recipient", recipient.toHexString())
  }
}

export function validatePoolFiltering(
  tokenId: BigInt,
  isTracked: boolean,
  expectedEntityCount: i32 = 0
): void {
  if (isTracked) {
    // Position should exist for tracked pools
    assert.fieldEquals("Position", tokenId.toString(), "id", tokenId.toString())
  } else {
    // Position should not exist for untracked pools
    assert.notInStore("Position", tokenId.toString())
    
    // Events should not exist either
    let mintEventId = getExpectedEventId(tokenId, "MINT")
    assert.notInStore("PositionEvent", mintEventId)
  }
  
  if (expectedEntityCount > 0) {
    assert.entityCount("Position", expectedEntityCount)
  }
}

 