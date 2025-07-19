import { newMockEvent } from "matchstick-as"
import { ethereum, Address, BigInt } from "@graphprotocol/graph-ts"
import {
  Approval,
  ApprovalForAll,
  Collect,
  DecreaseLiquidity,
  IncreaseLiquidity,
  Transfer
} from "../generated/NonfungiblePositionManager/NonfungiblePositionManager"

export function createApprovalEvent(
  owner: Address,
  approved: Address,
  tokenId: BigInt
): Approval {
  let approvalEvent = changetype<Approval>(newMockEvent())

  approvalEvent.parameters = new Array()

  approvalEvent.parameters.push(
    new ethereum.EventParam("owner", ethereum.Value.fromAddress(owner))
  )
  approvalEvent.parameters.push(
    new ethereum.EventParam("approved", ethereum.Value.fromAddress(approved))
  )
  approvalEvent.parameters.push(
    new ethereum.EventParam(
      "tokenId",
      ethereum.Value.fromUnsignedBigInt(tokenId)
    )
  )

  return approvalEvent
}

export function createApprovalForAllEvent(
  owner: Address,
  operator: Address,
  approved: boolean
): ApprovalForAll {
  let approvalForAllEvent = changetype<ApprovalForAll>(newMockEvent())

  approvalForAllEvent.parameters = new Array()

  approvalForAllEvent.parameters.push(
    new ethereum.EventParam("owner", ethereum.Value.fromAddress(owner))
  )
  approvalForAllEvent.parameters.push(
    new ethereum.EventParam("operator", ethereum.Value.fromAddress(operator))
  )
  approvalForAllEvent.parameters.push(
    new ethereum.EventParam("approved", ethereum.Value.fromBoolean(approved))
  )

  return approvalForAllEvent
}

export function createCollectEvent(
  tokenId: BigInt,
  recipient: Address,
  amount0: BigInt,
  amount1: BigInt
): Collect {
  let collectEvent = changetype<Collect>(newMockEvent())

  collectEvent.parameters = new Array()

  collectEvent.parameters.push(
    new ethereum.EventParam(
      "tokenId",
      ethereum.Value.fromUnsignedBigInt(tokenId)
    )
  )
  collectEvent.parameters.push(
    new ethereum.EventParam("recipient", ethereum.Value.fromAddress(recipient))
  )
  collectEvent.parameters.push(
    new ethereum.EventParam(
      "amount0",
      ethereum.Value.fromUnsignedBigInt(amount0)
    )
  )
  collectEvent.parameters.push(
    new ethereum.EventParam(
      "amount1",
      ethereum.Value.fromUnsignedBigInt(amount1)
    )
  )

  return collectEvent
}

export function createDecreaseLiquidityEvent(
  tokenId: BigInt,
  liquidity: BigInt,
  amount0: BigInt,
  amount1: BigInt
): DecreaseLiquidity {
  let decreaseLiquidityEvent = changetype<DecreaseLiquidity>(newMockEvent())

  decreaseLiquidityEvent.parameters = new Array()

  decreaseLiquidityEvent.parameters.push(
    new ethereum.EventParam(
      "tokenId",
      ethereum.Value.fromUnsignedBigInt(tokenId)
    )
  )
  decreaseLiquidityEvent.parameters.push(
    new ethereum.EventParam(
      "liquidity",
      ethereum.Value.fromUnsignedBigInt(liquidity)
    )
  )
  decreaseLiquidityEvent.parameters.push(
    new ethereum.EventParam(
      "amount0",
      ethereum.Value.fromUnsignedBigInt(amount0)
    )
  )
  decreaseLiquidityEvent.parameters.push(
    new ethereum.EventParam(
      "amount1",
      ethereum.Value.fromUnsignedBigInt(amount1)
    )
  )

  return decreaseLiquidityEvent
}

export function createIncreaseLiquidityEvent(
  tokenId: BigInt,
  liquidity: BigInt,
  amount0: BigInt,
  amount1: BigInt
): IncreaseLiquidity {
  let increaseLiquidityEvent = changetype<IncreaseLiquidity>(newMockEvent())

  increaseLiquidityEvent.parameters = new Array()

  increaseLiquidityEvent.parameters.push(
    new ethereum.EventParam(
      "tokenId",
      ethereum.Value.fromUnsignedBigInt(tokenId)
    )
  )
  increaseLiquidityEvent.parameters.push(
    new ethereum.EventParam(
      "liquidity",
      ethereum.Value.fromUnsignedBigInt(liquidity)
    )
  )
  increaseLiquidityEvent.parameters.push(
    new ethereum.EventParam(
      "amount0",
      ethereum.Value.fromUnsignedBigInt(amount0)
    )
  )
  increaseLiquidityEvent.parameters.push(
    new ethereum.EventParam(
      "amount1",
      ethereum.Value.fromUnsignedBigInt(amount1)
    )
  )

  return increaseLiquidityEvent
}

export function createTransferEvent(
  from: Address,
  to: Address,
  tokenId: BigInt
): Transfer {
  let transferEvent = changetype<Transfer>(newMockEvent())

  transferEvent.parameters = new Array()

  transferEvent.parameters.push(
    new ethereum.EventParam("from", ethereum.Value.fromAddress(from))
  )
  transferEvent.parameters.push(
    new ethereum.EventParam("to", ethereum.Value.fromAddress(to))
  )
  transferEvent.parameters.push(
    new ethereum.EventParam(
      "tokenId",
      ethereum.Value.fromUnsignedBigInt(tokenId)
    )
  )

  return transferEvent
}

// Additional utility functions for testing

export function createMintEvent(to: Address, tokenId: BigInt): Transfer {
  let zeroAddress = Address.fromString("0x0000000000000000000000000000000000000000")
  return createTransferEvent(zeroAddress, to, tokenId)
}

export function getPositionEventId(txHash: string, tokenId: BigInt, eventType: string): string {
  return txHash + "-" + tokenId.toString() + "-" + eventType
}

// Common test constants
export const ZERO_ADDRESS = Address.fromString("0x0000000000000000000000000000000000000000")
export const DEFAULT_USER = Address.fromString("0x0000000000000000000000000000000000000001")
export const DEFAULT_USER_2 = Address.fromString("0x0000000000000000000000000000000000000002")
export const DEFAULT_TOKEN_ID = BigInt.fromI32(1234)
export const DEFAULT_LIQUIDITY = BigInt.fromI32(1000000)
export const DEFAULT_AMOUNT_0 = BigInt.fromI32(100)
export const DEFAULT_AMOUNT_1 = BigInt.fromI32(200)
