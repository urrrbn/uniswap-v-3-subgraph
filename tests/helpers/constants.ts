import { Address, BigInt } from "@graphprotocol/graph-ts"

// Test Pool Addresses
export const TRACKED_POOL = Address.fromString("0x1111111111111111111111111111111111111111")
export const TRACKED_POOL_2 = Address.fromString("0x3333333333333333333333333333333333333333")
export const UNTRACKED_POOL = Address.fromString("0x2222222222222222222222222222222222222222")

// Contract Addresses
export const FACTORY_ADDRESS = Address.fromString("0x1F98431c8aD98523631AE4a59f267346ea31F984")
export const CONTRACT_ADDRESS = Address.fromString("0xC36442b4a4522E871399CD717aBDD847Ab11FE88")

// Token Addresses for Pool 1
export const TOKEN0 = Address.fromString("0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48")
export const TOKEN1 = Address.fromString("0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2")
export const FEE = BigInt.fromI32(3000)

// Token Addresses for Pool 2 (to avoid mock conflicts)
export const TOKEN0_POOL2 = Address.fromString("0xB0b86991c6218b36c1d19D4a2e9Eb0cE3606eB49")
export const TOKEN1_POOL2 = Address.fromString("0xD02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc3")
export const FEE_POOL2 = BigInt.fromI32(500)

// Test User Addresses
export const USER_1 = Address.fromString("0x1234567890123456789012345678901234567890")
export const USER_2 = Address.fromString("0x2345678901234567890123456789012345678901")
export const USER_3 = Address.fromString("0x3456789012345678901234567890123456789012")

 