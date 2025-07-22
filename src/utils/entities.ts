import { BigInt, Bytes, Address, ethereum } from "@graphprotocol/graph-ts"
import {
  User,
  Position,
  PositionEvent
} from "../../generated/schema"
import {
  NonfungiblePositionManager
} from "../../generated/NonfungiblePositionManager/NonfungiblePositionManager"
import {
  UniswapV3Factory
} from "../../generated/NonfungiblePositionManager/UniswapV3Factory"
import { isTrackedPool } from './pool'

/**
 * Load or create a User entity
 * Used across multiple handlers to ensure consistent user creation
 */
export function loadOrCreateUser(address: Bytes): User {
  let user = User.load(address)
  if (user == null) {
    user = new User(address)
    user.totalBitUSDVolume = BigInt.zero()
    user.lastPurchaseTimestamp = BigInt.zero()
    user.save()
  }
  return user
}

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

/**
 * Load or initialise a Position for tokenId.
 * Returns null if the pool is NOT in TARGET_POOLS.
 * Uses one factory.getPool() call the first time the tokenId is seen.
 */
export function getOrInitPosition(event: ethereum.Event, tokenId: BigInt): Position | null {
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