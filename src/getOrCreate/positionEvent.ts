import { BigInt, Bytes } from '@graphprotocol/graph-ts'
import { Position, PositionEvent } from '../../generated/schema'


/**
 * Create a position event
 * Used for tracking all position-related events (MINT, INCREASE, DECREASE, TRANSFER)
 */
export function createPositionEvent(
  position: Position,
  type: string,
  txHash: Bytes,
  logIndex: BigInt,
  timestamp: BigInt,
  blockNumber: BigInt,
  amount: BigInt,
  amount0: BigInt,
  amount1: BigInt,
  sender: Bytes,
  recipient: Bytes | null = null
): PositionEvent {
  const eventId =
    txHash.toHexString() +
    '-' +
    logIndex.toString() +
    '-' +
    position.id +
    '-' +
    type.toString()
  const positionEvent = new PositionEvent(eventId)

  positionEvent.position = position.id
  positionEvent.type = type
  positionEvent.txHash = txHash
  positionEvent.timestamp = timestamp
  positionEvent.blockNumber = blockNumber
  positionEvent.amount = amount
  positionEvent.amount0 = amount0
  positionEvent.amount1 = amount1
  positionEvent.sender = sender
  if (recipient) {
    positionEvent.recipient = recipient
  }

  positionEvent.save()
  return positionEvent
}