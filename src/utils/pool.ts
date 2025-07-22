import { Address, BigInt } from '@graphprotocol/graph-ts'
import { POOL_CONFIGS } from '../config/constants'

// Pool configuration interface for BitUSD tracking
export class PoolConfig {
  address: Address
  bitUSDTokenIndex: i32 // 0 if BitUSD is token0, 1 if BitUSD is token1
  name: string

  constructor(address: Address, bitUSDTokenIndex: i32, name: string) {
    this.address = address
    this.bitUSDTokenIndex = bitUSDTokenIndex
    this.name = name
  }
}

export function isTrackedPool(pool: Address): bool {
  return getPoolConfig(pool) !== null
}

export function getPoolConfig(poolAddress: Address): PoolConfig | null {
  for (let i = 0; i < POOL_CONFIGS.length; i++) {
    if (POOL_CONFIGS[i].address.equals(poolAddress)) {
      return POOL_CONFIGS[i]
    }
  }
  return null
}

/**
 * Determines if a swap is buying BitUSD based on the pool configuration and amounts
 * Returns true if user is buying BitUSD, false otherwise
 */
export function isBuyingBitUSD(poolAddress: Address, amount0: BigInt, amount1: BigInt): bool {
  let config = getPoolConfig(poolAddress)
  if (config === null) return false

  if (config.bitUSDTokenIndex == 0) {
    // BitUSD is token0 - buying means amount0 < 0 (receiving BitUSD)
    return amount0.lt(BigInt.zero())
  } else {
    // BitUSD is token1 - buying means amount1 < 0 (receiving BitUSD)
    return amount1.lt(BigInt.zero())
  }
}

/**
 * Gets the BitUSD amount from a swap (always returns positive value)
 */
export function getBitUSDAmount(poolAddress: Address, amount0: BigInt, amount1: BigInt): BigInt {
  let config = getPoolConfig(poolAddress)
  if (config === null) return BigInt.zero()

  if (config.bitUSDTokenIndex == 0) {
    return amount0.abs() // BitUSD is token0
  } else {
    return amount1.abs() // BitUSD is token1
  }
}

/**
 * Gets the other token amount from a swap (always returns positive value)
 */
export function getOtherTokenAmount(poolAddress: Address, amount0: BigInt, amount1: BigInt): BigInt {
  let config = getPoolConfig(poolAddress)
  if (config === null) return BigInt.zero()

  if (config.bitUSDTokenIndex == 0) {
    return amount1.abs() // Other token is token1
  } else {
    return amount0.abs() // Other token is token0
  }
} 