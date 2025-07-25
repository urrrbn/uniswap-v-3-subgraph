import { BigInt, Bytes, Address, ethereum } from '@graphprotocol/graph-ts'
import { User, Position, PositionEvent } from '../../generated/schema'
import { NonfungiblePositionManager } from '../../generated/NonfungiblePositionManager/NonfungiblePositionManager'
import { UniswapV3Factory } from '../../generated/NonfungiblePositionManager/UniswapV3Factory'
import { isTrackedPool } from '../helpers/pool'
import { getOrCreateUser } from './user'


/**
 * Load or initialise a Position for tokenId.
 * Returns null if the pool is NOT in TARGET_POOLS.
 * Uses one factory.getPool() call the first time the tokenId is seen.
 */
export function getOrCreatePosition(
  event: ethereum.Event,
  tokenId: BigInt
): Position | null {
  let pos = Position.load(tokenId.toString())
  if (pos !== null) {
    return isTrackedPool(Address.fromBytes(pos.pool as Bytes)) ? pos : null
  }

  // ───── first encounter ─────
  const mgr = NonfungiblePositionManager.bind(event.address)
  const res = mgr.try_positions(tokenId)
  if (res.reverted) return null

  const staticData = res.value // (nonce, operator, token0, token1, fee, ...)
  // Get factory address from position manager
  const factoryResult = mgr.try_factory()
  if (factoryResult.reverted) return null

  const factory = UniswapV3Factory.bind(factoryResult.value)
  const poolAddr = factory.getPool(
    staticData.value2,
    staticData.value3,
    staticData.value4
  )

  if (!isTrackedPool(poolAddr)) return null

  // Get the actual owner from the NFT contract
  const ownerResult = mgr.try_ownerOf(tokenId)
  if (ownerResult.reverted) return null

  pos = new Position(tokenId.toString())
  pos.pool = poolAddr
  pos.owner = getOrCreateUser(ownerResult.value).id
  pos.createdAt = BigInt.fromI32(0) // Will be set by handleIncreaseLiquidity on first MINT
  pos.liquidity = BigInt.zero()
  pos.save()
  return pos
}
