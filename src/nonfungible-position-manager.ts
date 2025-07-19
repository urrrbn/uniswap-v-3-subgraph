import { BigInt, Bytes, Address, ethereum } from "@graphprotocol/graph-ts"
import {
  DecreaseLiquidity as DecreaseLiquidityEvent,
  IncreaseLiquidity as IncreaseLiquidityEvent,
  Transfer as TransferEvent,
  NonfungiblePositionManager
} from "../generated/NonfungiblePositionManager/NonfungiblePositionManager"
import {
  UniswapV3Factory
} from "../generated/NonfungiblePositionManager/UniswapV3Factory"
import {
  User,
  Position,
  PositionEvent
} from "../generated/schema"
import { TARGET_POOLS, isTrackedPool } from './constants'

function loadOrCreateUser(address: Bytes): User {
  let user = User.load(address)
  if (user == null) {
    user = new User(address)
    user.save()
  }
  return user
}



function createPositionEvent(
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
  let eventId = txHash.toHexString() + "-" + logIndex.toString() + "-" + position.id + "-" + type.toString()
  let positionEvent = new PositionEvent(eventId)
  
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

/**  Load or initialise a Position for tokenId.
 *  Returns null if the pool is NOT in TARGET_POOLS.
 *  Uses one factory.getPool() call the first time the tokenId is seen.
 */
function getOrInitPosition(event: ethereum.Event, tokenId: BigInt): Position | null {
  let pos = Position.load(tokenId.toString())
  if (pos !== null) {
    return isTrackedPool(Address.fromBytes(pos.pool as Bytes)) ? pos : null
  }

  // ───── first encounter ─────
  let mgr  = NonfungiblePositionManager.bind(event.address)
  let res  = mgr.try_positions(tokenId)
  if (res.reverted) return null

  let staticData = res.value  // (nonce, operator, token0, token1, fee, ...)
  // Get factory address from position manager
  let factoryResult = mgr.try_factory()
  if (factoryResult.reverted) return null
  
  let factory = UniswapV3Factory.bind(factoryResult.value)
  let poolAddr = factory.getPool(staticData.value2, staticData.value3, staticData.value4)

  if (!isTrackedPool(poolAddr)) return null

  // Get the actual owner from the NFT contract
  let ownerResult = mgr.try_ownerOf(tokenId)
  if (ownerResult.reverted) return null

  pos              = new Position(tokenId.toString())
  pos.pool         = poolAddr
  pos.owner        = loadOrCreateUser(ownerResult.value).id
  pos.createdAt    = BigInt.fromI32(0)  // Will be set by handleIncreaseLiquidity on first MINT
  pos.liquidity    = BigInt.zero()
  pos.save()
  return pos
}

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
