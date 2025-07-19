import { BigInt, Bytes, Address } from "@graphprotocol/graph-ts"
import {
  DecreaseLiquidity as DecreaseLiquidityEvent,
  IncreaseLiquidity as IncreaseLiquidityEvent,
  Transfer as TransferEvent,
  NonfungiblePositionManager
} from "../generated/NonfungiblePositionManager/NonfungiblePositionManager"
import {
  User,
  Position,
  PositionEvent
} from "../generated/schema"

function loadOrCreateUser(address: Bytes): User {
  let user = User.load(address)
  if (user == null) {
    user = new User(address)
    user.save()
  }
  return user
}

function loadOrCreatePosition(tokenId: BigInt, owner: Bytes): Position {
  let position = Position.load(tokenId.toString())
  if (position == null) {
    position = new Position(tokenId.toString())
    position.owner = loadOrCreateUser(owner).id
    position.createdAt = BigInt.fromI32(0) // Will be set when first event is processed
    position.liquidity = BigInt.fromI32(0)
    position.save()
  }
  return position
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

export function handleDecreaseLiquidity(event: DecreaseLiquidityEvent): void {
  let tokenId = event.params.tokenId
  let liquidityDelta = event.params.liquidity
  let amount0 = event.params.amount0
  let amount1 = event.params.amount1
  
  // Get the NFT contract
  let nftContract = NonfungiblePositionManager.bind(event.address)
  let ownerResult = nftContract.try_ownerOf(tokenId)
  if (ownerResult.reverted) {
    return // Position doesn't exist or was burned
  }
  
  let owner = ownerResult.value
  let position = loadOrCreatePosition(tokenId, owner)
  
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
  let tokenId = event.params.tokenId
  let liquidityDelta = event.params.liquidity
  let amount0 = event.params.amount0
  let amount1 = event.params.amount1
  
  // Get the NFT contract
  let nftContract = NonfungiblePositionManager.bind(event.address)
  let ownerResult = nftContract.try_ownerOf(tokenId)
  if (ownerResult.reverted) {
    return // Position doesn't exist
  }
  
  let owner = ownerResult.value
  let position = loadOrCreatePosition(tokenId, owner)
  
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
    // Get the NFT contract to find the owner
    let nftContract = NonfungiblePositionManager.bind(event.address)
    let ownerResult = nftContract.try_ownerOf(tokenId)
    if (ownerResult.reverted) {
      return // Position doesn't exist
    }
    
    let owner = ownerResult.value
    let position = loadOrCreatePosition(tokenId, owner)
    
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
