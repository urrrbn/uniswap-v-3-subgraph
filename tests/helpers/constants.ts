import { Address, BigInt } from '@graphprotocol/graph-ts'

// Import real pool addresses from production constants
import {
  POOL_BITUSD_MBTILL,
  POOL_WSTROSE_BITUSD,
  POOL_WROSE_BITUSD,
} from '../../src/config/constants'

// Pool addresses for tests (using real production pools)
export const TRACKED_POOL = POOL_BITUSD_MBTILL // BitUSD/mTBILL pool
export const TRACKED_POOL_2 = POOL_WSTROSE_BITUSD // wstROSE/BitUSD pool
export const TRACKED_POOL_3 = POOL_WROSE_BITUSD // wROSE/BitUSD pool

// Test-specific addresses (not related to production)
export const UNTRACKED_POOL = Address.fromString(
  '0x2222222222222222222222222222222222222222'
)

// Contract Addresses
export const FACTORY_ADDRESS = Address.fromString(
  '0x1F98431c8aD98523631AE4a59f267346ea31F984'
)
export const CONTRACT_ADDRESS = Address.fromString(
  '0xC36442b4a4522E871399CD717aBDD847Ab11FE88'
)

// Token Addresses for mock testing
export const TOKEN0 = Address.fromString(
  '0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48'
)
export const TOKEN1 = Address.fromString(
  '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2'
)
export const FEE = BigInt.fromI32(3000)

// Pool 2 specific tokens (for multi-pool testing)
export const TOKEN0_POOL2 = Address.fromString(
  '0xB0b86991c6218b36c1d19D4a2e9Eb0cE3606eB49'
)
export const TOKEN1_POOL2 = Address.fromString(
  '0xD02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc3'
)
export const FEE_POOL2 = BigInt.fromI32(500)

// Test User Addresses
export const USER_1 = Address.fromString(
  '0x1234567890123456789012345678901234567890'
)
export const USER_2 = Address.fromString(
  '0x2345678901234567890123456789012345678901'
)
