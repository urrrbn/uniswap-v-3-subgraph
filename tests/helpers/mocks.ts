import { createMockedFunction } from 'matchstick-as/assembly/index'
import { Address, BigInt, ethereum } from '@graphprotocol/graph-ts'
import {
  FACTORY_ADDRESS,
  TRACKED_POOL,
  TRACKED_POOL_2,
  UNTRACKED_POOL,
  TOKEN0,
  TOKEN1,
  FEE,
  TOKEN0_POOL2,
  TOKEN1_POOL2,
  FEE_POOL2,
} from './constants'

// Mock contract calls
export function mockOwnerOfCall(
  contractAddress: Address,
  tokenId: BigInt,
  owner: Address
): void {
  createMockedFunction(contractAddress, 'ownerOf', 'ownerOf(uint256):(address)')
    .withArgs([ethereum.Value.fromUnsignedBigInt(tokenId)])
    .returns([ethereum.Value.fromAddress(owner)])
}

export function mockPositionsCall(
  contractAddress: Address,
  tokenId: BigInt,
  token0: Address,
  token1: Address,
  fee: BigInt
): void {
  createMockedFunction(
    contractAddress,
    'positions',
    'positions(uint256):(uint96,address,address,address,uint24,int24,int24,uint128,uint256,uint256,uint128,uint128)'
  )
    .withArgs([ethereum.Value.fromUnsignedBigInt(tokenId)])
    .returns([
      ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(0)), // nonce
      ethereum.Value.fromAddress(Address.zero()), // operator
      ethereum.Value.fromAddress(token0), // token0
      ethereum.Value.fromAddress(token1), // token1
      ethereum.Value.fromUnsignedBigInt(fee), // fee
      ethereum.Value.fromSignedBigInt(BigInt.fromI32(0)), // tickLower
      ethereum.Value.fromSignedBigInt(BigInt.fromI32(0)), // tickUpper
      ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(0)), // liquidity
      ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(0)), // feeGrowthInside0LastX128
      ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(0)), // feeGrowthInside1LastX128
      ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(0)), // tokensOwed0
      ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(0)), // tokensOwed1
    ])
}

export function mockFactoryCall(contractAddress: Address): void {
  createMockedFunction(
    contractAddress,
    'factory',
    'factory():(address)'
  ).returns([ethereum.Value.fromAddress(FACTORY_ADDRESS)])
}

export function mockGetPoolCall(
  factoryAddress: Address,
  token0: Address,
  token1: Address,
  fee: BigInt,
  poolAddress: Address
): void {
  createMockedFunction(
    factoryAddress,
    'getPool',
    'getPool(address,address,uint24):(address)'
  )
    .withArgs([
      ethereum.Value.fromAddress(token0),
      ethereum.Value.fromAddress(token1),
      ethereum.Value.fromUnsignedBigInt(fee),
    ])
    .returns([ethereum.Value.fromAddress(poolAddress)])
}

// Composite mock setups for common scenarios
export function setupTrackedPoolMocks(
  contractAddress: Address,
  tokenId: BigInt,
  owner: Address
): void {
  mockOwnerOfCall(contractAddress, tokenId, owner)
  mockPositionsCall(contractAddress, tokenId, TOKEN0, TOKEN1, FEE)
  mockFactoryCall(contractAddress)
  mockGetPoolCall(FACTORY_ADDRESS, TOKEN0, TOKEN1, FEE, TRACKED_POOL)
}

export function setupTrackedPool2Mocks(
  contractAddress: Address,
  tokenId: BigInt,
  owner: Address
): void {
  mockOwnerOfCall(contractAddress, tokenId, owner)
  mockPositionsCall(
    contractAddress,
    tokenId,
    TOKEN0_POOL2,
    TOKEN1_POOL2,
    FEE_POOL2
  )
  mockFactoryCall(contractAddress)
  mockGetPoolCall(
    FACTORY_ADDRESS,
    TOKEN0_POOL2,
    TOKEN1_POOL2,
    FEE_POOL2,
    TRACKED_POOL_2
  )
}

export function setupUntrackedPoolMocks(
  contractAddress: Address,
  tokenId: BigInt,
  owner: Address
): void {
  mockOwnerOfCall(contractAddress, tokenId, owner)
  mockPositionsCall(contractAddress, tokenId, TOKEN0, TOKEN1, FEE)
  mockFactoryCall(contractAddress)
  mockGetPoolCall(FACTORY_ADDRESS, TOKEN0, TOKEN1, FEE, UNTRACKED_POOL)
}
