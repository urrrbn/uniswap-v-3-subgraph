import { assert } from 'matchstick-as/assembly/index'
import { Address, BigInt } from '@graphprotocol/graph-ts'
import { getExpectedEventId } from './events'

// Test validation helpers for comprehensive testing
export function validatePositionLifecycle(
  tokenId: BigInt,
  expectedOwner: Address,
  expectedPool: Address,
  expectedLiquidity: BigInt
): void {
  // Validate position entity fields
  assert.fieldEquals('Position', tokenId.toString(), 'id', tokenId.toString())
  assert.fieldEquals(
    'Position',
    tokenId.toString(),
    'owner',
    expectedOwner.toHexString()
  )
  assert.fieldEquals(
    'Position',
    tokenId.toString(),
    'pool',
    expectedPool.toHexString()
  )
  assert.fieldEquals(
    'Position',
    tokenId.toString(),
    'liquidity',
    expectedLiquidity.toString()
  )
}

export function validateEventCreation(
  tokenId: BigInt,
  eventType: string,
  expectedAmount: BigInt,
  sender: Address | null = null,
  recipient: Address | null = null
): void {
  const eventId = getExpectedEventId(tokenId, eventType)

  // Validate core event fields
  assert.fieldEquals('PositionEvent', eventId, 'type', eventType)
  assert.fieldEquals('PositionEvent', eventId, 'position', tokenId.toString())

  // Validate event-specific fields
  if (expectedAmount.gt(BigInt.zero())) {
    assert.fieldEquals(
      'PositionEvent',
      eventId,
      'amount',
      expectedAmount.toString()
    )
  }

  // Validate sender/recipient for transfer events
  if (sender !== null) {
    assert.fieldEquals(
      'PositionEvent',
      eventId,
      'sender',
      sender!.toHexString()
    )
  }
  if (recipient !== null) {
    assert.fieldEquals(
      'PositionEvent',
      eventId,
      'recipient',
      recipient!.toHexString()
    )
  }
}
