import { Address } from '@graphprotocol/graph-ts'
import { PoolConfig } from '../helpers/pool'

// Configuration for all tracked pools 
export const POOL_CONFIGS: PoolConfig[] = [
  new PoolConfig(
    Address.fromString('0x33cFE8f63518Dc43798B6BC0009a42c73D87B0Cf'), // BitUSD/mTBILL
    0, // BitUSD is token0
    'BitUSD/mTBILL'
  ),
]

// Individual pool addresses for easy import
export const POOL_BITUSD_MBTILL = POOL_CONFIGS[0].address // BitUSD/mTBILL pool
// export const POOL_WSTROSE_BITUSD = POOL_CONFIGS[1].address // wstROSE/BitUSD pool
// export const POOL_WROSE_BITUSD = POOL_CONFIGS[2].address // wROSE/BitUSD pool

// Derived arrays for convenience
export const TARGET_POOLS: Address[] = POOL_CONFIGS.map<Address>(
  config => config.address
)
