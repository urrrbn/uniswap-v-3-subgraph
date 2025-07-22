import { newMockEvent } from "matchstick-as/assembly/index"
import { Address, BigInt, ethereum } from "@graphprotocol/graph-ts"
import { DecreaseLiquidity, IncreaseLiquidity, Transfer } from "../../generated/NonfungiblePositionManager/NonfungiblePositionManager"
import { Swap } from "../../generated/BitUSDmTBILLPool/UniswapV3Pool"
import { CONTRACT_ADDRESS } from "./constants"

// Helper function to generate consistent event IDs matching what the handlers create
export function getExpectedEventId(tokenId: BigInt, eventType: string): string {
  // Mock events generate consistent transaction hash and log index
  let txHash = "0xa16081f360e3847006db660bae1c6d1b2e17ec2a"
  let logIndex = "1"
  return txHash + "-" + logIndex + "-" + tokenId.toString() + "-" + eventType
}

// Helper function to generate consistent swap IDs
export function getExpectedSwapId(): string {
  // Mock events generate consistent transaction hash and log index
  let txHash = "0xa16081f360e3847006db660bae1c6d1b2e17ec2a"
  let logIndex = "1"
  return txHash + "-" + logIndex
}

// Event creation helpers
export function createIncreaseLiquidityEvent(
  tokenId: BigInt,
  liquidity: BigInt,
  amount0: BigInt,
  amount1: BigInt
): IncreaseLiquidity {
  let mockEvent = newMockEvent()
  let event = new IncreaseLiquidity(
    CONTRACT_ADDRESS,
    mockEvent.logIndex,
    mockEvent.transactionLogIndex,
    mockEvent.logType,
    mockEvent.block,
    mockEvent.transaction,
    mockEvent.parameters,
    mockEvent.receipt
  )
  
  event.parameters = new Array()
  event.parameters.push(
    new ethereum.EventParam("tokenId", ethereum.Value.fromUnsignedBigInt(tokenId))
  )
  event.parameters.push(
    new ethereum.EventParam("liquidity", ethereum.Value.fromUnsignedBigInt(liquidity))
  )
  event.parameters.push(
    new ethereum.EventParam("amount0", ethereum.Value.fromUnsignedBigInt(amount0))
  )
  event.parameters.push(
    new ethereum.EventParam("amount1", ethereum.Value.fromUnsignedBigInt(amount1))
  )
  
  return event
}

export function createDecreaseLiquidityEvent(
  tokenId: BigInt,
  liquidity: BigInt,
  amount0: BigInt,
  amount1: BigInt
): DecreaseLiquidity {
  let mockEvent = newMockEvent()
  let event = new DecreaseLiquidity(
    CONTRACT_ADDRESS,
    mockEvent.logIndex,
    mockEvent.transactionLogIndex,
    mockEvent.logType,
    mockEvent.block,
    mockEvent.transaction,
    mockEvent.parameters,
    mockEvent.receipt
  )
  
  event.parameters = new Array()
  event.parameters.push(
    new ethereum.EventParam("tokenId", ethereum.Value.fromUnsignedBigInt(tokenId))
  )
  event.parameters.push(
    new ethereum.EventParam("liquidity", ethereum.Value.fromUnsignedBigInt(liquidity))
  )
  event.parameters.push(
    new ethereum.EventParam("amount0", ethereum.Value.fromUnsignedBigInt(amount0))
  )
  event.parameters.push(
    new ethereum.EventParam("amount1", ethereum.Value.fromUnsignedBigInt(amount1))
  )
  
  return event
}

export function createTransferEvent(
  from: Address,
  to: Address,
  tokenId: BigInt
): Transfer {
  let mockEvent = newMockEvent()
  let event = new Transfer(
    CONTRACT_ADDRESS,
    mockEvent.logIndex,
    mockEvent.transactionLogIndex,
    mockEvent.logType,
    mockEvent.block,
    mockEvent.transaction,
    mockEvent.parameters,
    mockEvent.receipt
  )
  
  event.parameters = new Array()
  event.parameters.push(
    new ethereum.EventParam("from", ethereum.Value.fromAddress(from))
  )
  event.parameters.push(
    new ethereum.EventParam("to", ethereum.Value.fromAddress(to))
  )
  event.parameters.push(
    new ethereum.EventParam("tokenId", ethereum.Value.fromUnsignedBigInt(tokenId))
  )
  
  return event
}

export function createSwapEvent(
  poolAddress: Address,
  sender: Address,
  recipient: Address,
  amount0: BigInt,
  amount1: BigInt,
  transactionFrom: Address = sender  // Default to sender for backwards compatibility
): Swap {
  let mockEvent = newMockEvent()
  let event = new Swap(
    poolAddress,
    mockEvent.logIndex,
    mockEvent.transactionLogIndex,
    mockEvent.logType,
    mockEvent.block,
    mockEvent.transaction,
    mockEvent.parameters,
    mockEvent.receipt
  )
  
  // Set the transaction initiator (actual user)
  event.transaction.from = transactionFrom
  
  event.parameters = new Array()
  event.parameters.push(
    new ethereum.EventParam("sender", ethereum.Value.fromAddress(sender))
  )
  event.parameters.push(
    new ethereum.EventParam("recipient", ethereum.Value.fromAddress(recipient))
  )
  event.parameters.push(
    new ethereum.EventParam("amount0", ethereum.Value.fromSignedBigInt(amount0))
  )
  event.parameters.push(
    new ethereum.EventParam("amount1", ethereum.Value.fromSignedBigInt(amount1))
  )
  event.parameters.push(
    new ethereum.EventParam("sqrtPriceX96", ethereum.Value.fromUnsignedBigInt(BigInt.fromString("1461446703485210103287273052203988822378723970342")))
  )
  event.parameters.push(
    new ethereum.EventParam("liquidity", ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(50000)))
  )
  event.parameters.push(
    new ethereum.EventParam("tick", ethereum.Value.fromI32(200))
  )
  
  return event
} 