import {
  assert,
  describe,
  test,
  clearStore,
  beforeAll,
  afterAll,
  createMockedFunction,
  newMockEvent
} from "matchstick-as/assembly/index"
import { Address, BigInt, ethereum, Bytes } from "@graphprotocol/graph-ts"
import { DecreaseLiquidity, IncreaseLiquidity, Transfer } from "../generated/NonfungiblePositionManager/NonfungiblePositionManager"
import { handleDecreaseLiquidity, handleIncreaseLiquidity, handleTransfer } from "../src/nonfungible-position-manager"

// Mock contract calls
function mockOwnerOfCall(contractAddress: Address, tokenId: BigInt, owner: Address): void {
  createMockedFunction(contractAddress, "ownerOf", "ownerOf(uint256):(address)")
    .withArgs([ethereum.Value.fromUnsignedBigInt(tokenId)])
    .returns([ethereum.Value.fromAddress(owner)])
}

// Helper function to create IncreaseLiquidity event
function createIncreaseLiquidityEvent(
  tokenId: BigInt,
  liquidity: BigInt,
  amount0: BigInt,
  amount1: BigInt
): IncreaseLiquidity {
  let mockEvent = newMockEvent()
  let contractAddress = Address.fromString("0xC36442b4a4522E871399CD717aBDD847Ab11FE88")
  let event = new IncreaseLiquidity(
    contractAddress,
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

// Helper function to create DecreaseLiquidity event
function createDecreaseLiquidityEvent(
  tokenId: BigInt,
  liquidity: BigInt,
  amount0: BigInt,
  amount1: BigInt
): DecreaseLiquidity {
  let mockEvent = newMockEvent()
  let contractAddress = Address.fromString("0xC36442b4a4522E871399CD717aBDD847Ab11FE88")
  let event = new DecreaseLiquidity(
    contractAddress,
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

// Helper function to create Transfer event
function createTransferEvent(
  from: Address,
  to: Address,
  tokenId: BigInt
): Transfer {
  let mockEvent = newMockEvent()
  let contractAddress = Address.fromString("0xC36442b4a4522E871399CD717aBDD847Ab11FE88")
  let event = new Transfer(
    contractAddress,
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

describe("Nonfungible Position Manager", () => {
  beforeAll(() => {
    // Setup any global mocks if needed
  })

  afterAll(() => {
    clearStore()
  })

  test("handleIncreaseLiquidity creates position and event", () => {
    // Setup
    let tokenId = BigInt.fromI32(1)
    let liquidity = BigInt.fromI32(1000)
    let amount0 = BigInt.fromI32(100)
    let amount1 = BigInt.fromI32(200)
    let owner = Address.fromString("0x1234567890123456789012345678901234567890")
    let contractAddress = Address.fromString("0xC36442b4a4522E871399CD717aBDD847Ab11FE88")

    // Mock the ownerOf call
    mockOwnerOfCall(contractAddress, tokenId, owner)

    // Create mock event
    let mockEvent = createIncreaseLiquidityEvent(tokenId, liquidity, amount0, amount1)

    // Execute
    handleIncreaseLiquidity(mockEvent)

    // Assert position exists
    assert.fieldEquals("Position", tokenId.toString(), "owner", owner.toHexString())
    assert.fieldEquals("Position", tokenId.toString(), "liquidity", liquidity.toString())

    // Assert event was created
    let eventId = mockEvent.transaction.hash.toHexString() + "-" + mockEvent.logIndex.toString() + "-" + tokenId.toString() + "-MINT"
    assert.fieldEquals("PositionEvent", eventId, "type", "MINT")
    assert.fieldEquals("PositionEvent", eventId, "amount", liquidity.toString())
  })

  test("handleDecreaseLiquidity updates position and creates event", () => {
    // Setup - first create a position
    let tokenId = BigInt.fromI32(2)
    let initialLiquidity = BigInt.fromI32(1000)
    let decreaseLiquidity = BigInt.fromI32(500)
    let amount0 = BigInt.fromI32(50)
    let amount1 = BigInt.fromI32(100)
    let owner = Address.fromString("0x1234567890123456789012345678901234567890")
    let contractAddress = Address.fromString("0xC36442b4a4522E871399CD717aBDD847Ab11FE88")

    // Mock the ownerOf call
    mockOwnerOfCall(contractAddress, tokenId, owner)

    // Create position first with IncreaseLiquidity
    let mockIncreaseEvent = createIncreaseLiquidityEvent(tokenId, initialLiquidity, BigInt.fromI32(100), BigInt.fromI32(200))
    handleIncreaseLiquidity(mockIncreaseEvent)

    // Now create decrease event
    let mockDecreaseEvent = createDecreaseLiquidityEvent(tokenId, decreaseLiquidity, amount0, amount1)

    // Execute
    handleDecreaseLiquidity(mockDecreaseEvent)

    // Assert position liquidity decreased
    let expectedLiquidity = initialLiquidity.minus(decreaseLiquidity)
    assert.fieldEquals("Position", tokenId.toString(), "liquidity", expectedLiquidity.toString())

    // Assert decrease event was created
    let eventId = mockDecreaseEvent.transaction.hash.toHexString() + "-" + mockDecreaseEvent.logIndex.toString() + "-" + tokenId.toString() + "-DECREASE"
    assert.fieldEquals("PositionEvent", eventId, "type", "DECREASE")
    assert.fieldEquals("PositionEvent", eventId, "amount", decreaseLiquidity.toString())
  })

  test("handleTransfer from zero address creates position", () => {
    // Setup
    let tokenId = BigInt.fromI32(3)
    let from = Address.zero()
    let to = Address.fromString("0x1234567890123456789012345678901234567890")
    let contractAddress = Address.fromString("0xC36442b4a4522E871399CD717aBDD847Ab11FE88")

    // Mock the ownerOf call
    mockOwnerOfCall(contractAddress, tokenId, to)

    // Create mock transfer event
    let mockEvent = createTransferEvent(from, to, tokenId)

    // Execute
    handleTransfer(mockEvent)

    // Assert position exists with correct owner
    assert.fieldEquals("Position", tokenId.toString(), "owner", to.toHexString())

    // Assert transfer event was created
    let eventId = mockEvent.transaction.hash.toHexString() + "-" + mockEvent.logIndex.toString() + "-" + tokenId.toString() + "-TRANSFER"
    assert.fieldEquals("PositionEvent", eventId, "type", "TRANSFER")
  })

  test("handleTransfer to zero address (burn) updates position", () => {
    // Setup - first create a position
    let tokenId = BigInt.fromI32(4)
    let owner = Address.fromString("0x1234567890123456789012345678901234567890")
    let contractAddress = Address.fromString("0xC36442b4a4522E871399CD717aBDD847Ab11FE88")

    // Mock the ownerOf call for initial creation
    mockOwnerOfCall(contractAddress, tokenId, owner)

    // Create position first
    let mockIncreaseEvent = createIncreaseLiquidityEvent(tokenId, BigInt.fromI32(1000), BigInt.fromI32(100), BigInt.fromI32(200))
    handleIncreaseLiquidity(mockIncreaseEvent)

    // Now create burn transfer
    let mockTransferEvent = createTransferEvent(owner, Address.zero(), tokenId)

    // Execute
    handleTransfer(mockTransferEvent)

    // Assert position owner is now zero address
    assert.fieldEquals("Position", tokenId.toString(), "owner", Address.zero().toHexString())

    // Assert transfer event was created
    let eventId = mockTransferEvent.transaction.hash.toHexString() + "-" + mockTransferEvent.logIndex.toString() + "-" + tokenId.toString() + "-TRANSFER"
    assert.fieldEquals("PositionEvent", eventId, "type", "TRANSFER")
  })

  test("follows complete position lifecycle as specified in README", () => {
    let tokenId = BigInt.fromI32(100)
    let user1 = Address.fromString("0x1111111111111111111111111111111111111111")
    let user2 = Address.fromString("0x2222222222222222222222222222222222222222")
    let contractAddress = Address.fromString("0xC36442b4a4522E871399CD717aBDD847Ab11FE88")

    // Mock ownerOf calls for different stages
    mockOwnerOfCall(contractAddress, tokenId, user1)

    // 1. NFT Mint: Transfer(0x000 → user) → Creates position + TRANSFER event
    // But first IncreaseLiquidity fires (adds initial liquidity) → MINT event
    let mintLiquidityEvent = createIncreaseLiquidityEvent(tokenId, BigInt.fromI32(1000), BigInt.fromI32(100), BigInt.fromI32(200))
    handleIncreaseLiquidity(mintLiquidityEvent)

    // Check position was created and MINT event exists
    assert.fieldEquals("Position", tokenId.toString(), "owner", user1.toHexString())
    assert.fieldEquals("Position", tokenId.toString(), "liquidity", "1000")
    
    let mintEventId = mintLiquidityEvent.transaction.hash.toHexString() + "-" + mintLiquidityEvent.logIndex.toString() + "-" + tokenId.toString() + "-MINT"
    assert.fieldEquals("PositionEvent", mintEventId, "type", "MINT")

    // Then Transfer event fires (NFT mint)
    let transferMintEvent = createTransferEvent(Address.zero(), user1, tokenId)
    handleTransfer(transferMintEvent)

    // Check TRANSFER event was created for the mint
    let transferMintEventId = transferMintEvent.transaction.hash.toHexString() + "-" + transferMintEvent.logIndex.toString() + "-" + tokenId.toString() + "-TRANSFER"
    assert.fieldEquals("PositionEvent", transferMintEventId, "type", "TRANSFER")

    // 2. Add Liquidity: IncreaseLiquidity → INCREASE event (subsequent times)
    let addLiquidityEvent = createIncreaseLiquidityEvent(tokenId, BigInt.fromI32(500), BigInt.fromI32(50), BigInt.fromI32(100))
    handleIncreaseLiquidity(addLiquidityEvent)

    // Check liquidity increased and INCREASE event created
    assert.fieldEquals("Position", tokenId.toString(), "liquidity", "1500")
    
    let increaseEventId = addLiquidityEvent.transaction.hash.toHexString() + "-" + addLiquidityEvent.logIndex.toString() + "-" + tokenId.toString() + "-INCREASE"
    assert.fieldEquals("PositionEvent", increaseEventId, "type", "INCREASE")

    // 3. Remove Liquidity: DecreaseLiquidity → DECREASE event
    let removeLiquidityEvent = createDecreaseLiquidityEvent(tokenId, BigInt.fromI32(300), BigInt.fromI32(30), BigInt.fromI32(60))
    handleDecreaseLiquidity(removeLiquidityEvent)

    // Check liquidity decreased and DECREASE event created
    assert.fieldEquals("Position", tokenId.toString(), "liquidity", "1200")
    
    let decreaseEventId = removeLiquidityEvent.transaction.hash.toHexString() + "-" + removeLiquidityEvent.logIndex.toString() + "-" + tokenId.toString() + "-DECREASE"
    assert.fieldEquals("PositionEvent", decreaseEventId, "type", "DECREASE")

    // 4. Transfer NFT: Transfer(user → user) → TRANSFER event
    let transferEvent = createTransferEvent(user1, user2, tokenId)
    handleTransfer(transferEvent)

    // Check owner changed and TRANSFER event created
    assert.fieldEquals("Position", tokenId.toString(), "owner", user2.toHexString())
    
    let transferEventId = transferEvent.transaction.hash.toHexString() + "-" + transferEvent.logIndex.toString() + "-" + tokenId.toString() + "-TRANSFER"
    assert.fieldEquals("PositionEvent", transferEventId, "type", "TRANSFER")

    // 5. Burn NFT: Transfer(user → 0x000) → TRANSFER event
    let burnEvent = createTransferEvent(user2, Address.zero(), tokenId)
    handleTransfer(burnEvent)

    // Check owner is now zero address and TRANSFER event created
    assert.fieldEquals("Position", tokenId.toString(), "owner", Address.zero().toHexString())
    
    let burnEventId = burnEvent.transaction.hash.toHexString() + "-" + burnEvent.logIndex.toString() + "-" + tokenId.toString() + "-TRANSFER"
    assert.fieldEquals("PositionEvent", burnEventId, "type", "TRANSFER")
  })
})
