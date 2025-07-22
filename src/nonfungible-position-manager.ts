import { BigInt, Bytes, Address } from "@graphprotocol/graph-ts"
import {
  DecreaseLiquidity as DecreaseLiquidityEvent,
  IncreaseLiquidity as IncreaseLiquidityEvent,
  Transfer as TransferEvent,
} from "../generated/NonfungiblePositionManager/NonfungiblePositionManager"
import {
  Position
} from "../generated/schema"
import { isTrackedPool } from './utils/pool'
import { 
  loadOrCreateUser,
  createPositionEvent,
  getOrInitPosition
} from './utils/entities'

export function handleDecreaseLiquidity(event: DecreaseLiquidityEvent): void {
  // For decreases, only process existing positions - don't create new ones
  let position = Position.load(event.params.tokenId.toString())
  if (position == null) return   // <- early exit for non-existent positions
  
  // Additional check: ensure this position is from a tracked pool
  if (!isTrackedPool(Address.fromBytes(position.pool as Bytes))) {
    return // Not a tracked pool
  }
  
  let liquidityDelta = event.params.liquidity
  let amount0 = event.params.amount0
  let amount1 = event.params.amount1
  
  // Update position liquidity
  position.liquidity = position.liquidity.minus(liquidityDelta)
  position.save()
  
  // Create position event
  createPositionEvent(
    position,
    "DECREASE",
    event.transaction.hash,
    event.logIndex,
    event.block.timestamp,
    event.block.number,
    liquidityDelta,
    amount0,
    amount1,
    event.transaction.from
  )
}

export function handleIncreaseLiquidity(event: IncreaseLiquidityEvent): void {
  let position = getOrInitPosition(event, event.params.tokenId)
  if (position == null) return   // <- early exit for untracked pools
  
  let liquidityDelta = event.params.liquidity
  let amount0 = event.params.amount0
  let amount1 = event.params.amount1
  
  // If this is the first time we see this position, set createdAt and this is a MINT
  let isFirstIncrease = position.createdAt.equals(BigInt.fromI32(0))
  if (isFirstIncrease) {
    position.createdAt = event.block.timestamp
  }
  
  // Update position liquidity
  position.liquidity = position.liquidity.plus(liquidityDelta)
  position.save()
  
  // Create event - MINT only for the very first increase, otherwise INCREASE
  let eventType = isFirstIncrease ? "MINT" : "INCREASE"
  
  // Create position event
  createPositionEvent(
    position,
    eventType,
    event.transaction.hash,
    event.logIndex,
    event.block.timestamp,
    event.block.number,
    liquidityDelta,
    amount0,
    amount1,
    event.transaction.from
  )
}

export function handleTransfer(event: TransferEvent): void {
  let tokenId = event.params.tokenId
  let from = event.params.from
  let to = event.params.to
  
  // Handle new position creation (mint from zero address)
  if (from.equals(Address.zero())) {
    let position = getOrInitPosition(event, tokenId)
    if (position == null) return   // <- early exit for untracked pools
    
    // Update owner
    position.owner = loadOrCreateUser(to).id
    // Don't set createdAt here - let IncreaseLiquidity handle the MINT event
    position.save()
    
    // Only create TRANSFER event, not MINT (IncreaseLiquidity will handle MINT)
    createPositionEvent(
      position,
      "TRANSFER",
      event.transaction.hash,
      event.logIndex,
      event.block.timestamp,
      event.block.number,
      BigInt.fromI32(0), // No liquidity info in transfer event
      BigInt.fromI32(0), // No token amounts in transfer event
      BigInt.fromI32(0),
      from,
      to
    )
    return
  }
  
  // For existing positions (transfers and burns), check if we already have this position
  let position = Position.load(tokenId.toString())
  if (position == null) {
    return // We don't track this position
  }
  
  // Additional check: ensure this position is from a tracked pool
  if (!isTrackedPool(Address.fromBytes(position.pool as Bytes))) {
    return // Not a tracked pool
  }
  
  // Handle burn (transfer to zero address)
  if (to.equals(Address.zero())) {
    // Update owner to zero address
    position.owner = loadOrCreateUser(to).id
    position.save()
    
    // Create transfer event
    createPositionEvent(
      position,
      "TRANSFER",
      event.transaction.hash,
      event.logIndex,
      event.block.timestamp,
      event.block.number,
      BigInt.fromI32(0),
      BigInt.fromI32(0),
      BigInt.fromI32(0),
      from,
      to
    )
    return
  }
  
  // Handle regular transfers (not from/to zero address)
  // Update position owner
  position.owner = loadOrCreateUser(to).id
  position.save()
  
  // Create transfer event
  createPositionEvent(
    position,
    "TRANSFER",
    event.transaction.hash,
    event.logIndex,
    event.block.timestamp,
    event.block.number,
    BigInt.fromI32(0), // No liquidity change in transfer
    BigInt.fromI32(0), // No token amounts in transfer
    BigInt.fromI32(0),
    from,
    to
  )
}
