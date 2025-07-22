import {
  Swap as SwapEvent
} from "../generated/BitUSDmTBILLPool/UniswapV3Pool"
import {
  BitUSDPurchase
} from "../generated/schema"
import { 
  isTrackedPool, 
  isBuyingBitUSD, 
  getBitUSDAmount,
  getOtherTokenAmount
} from './utils/pool'
import { loadOrCreateUser } from './utils/entities'

export function handleSwap(event: SwapEvent): void {
  // Only process swaps from tracked pools
  if (!isTrackedPool(event.address)) {
    return
  }

  let amount0 = event.params.amount0
  let amount1 = event.params.amount1

  // Only process if this is a BitUSD purchase
  if (!isBuyingBitUSD(event.address, amount0, amount1)) {
    return
  }

  let sender = event.params.sender
  let recipient = event.params.recipient
  let bitUSDAmount = getBitUSDAmount(event.address, amount0, amount1)
  let otherTokenAmount = getOtherTokenAmount(event.address, amount0, amount1)
  let user = loadOrCreateUser(event.transaction.from)
  
  // Update user's total BitUSD volume and last purchase timestamp
  user.totalBitUSDVolume = user.totalBitUSDVolume.plus(bitUSDAmount)
  user.lastPurchaseTimestamp = event.block.timestamp
  user.save()

  // Create unique ID for the BitUSD purchase
  let purchaseId = event.transaction.hash.toHexString() + "-" + event.logIndex.toString()
  
  // Create BitUSD purchase entity
  let purchase = new BitUSDPurchase(purchaseId)
  purchase.pool = event.address
  purchase.user = user.id  
  purchase.sender = sender  // Keep original sender (router) for reference
  purchase.recipient = recipient
  purchase.bitUSDAmount = bitUSDAmount
  purchase.otherTokenAmount = otherTokenAmount
  purchase.txHash = event.transaction.hash
  purchase.timestamp = event.block.timestamp
  purchase.blockNumber = event.block.number
  purchase.logIndex = event.logIndex
  
  purchase.save()
} 