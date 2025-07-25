import { Address } from '@graphprotocol/graph-ts'
import { PoolConfig } from '../helpers/pool'

// Configuration for all tracked pools 
export const POOL_CONFIGS: PoolConfig[] = [
  new PoolConfig(
    Address.fromString('0x3416cF6C708Da44DB2624D63ea0AAef7113527C6'), // BitUSD/mTBILL
    0, // BitUSD is token0
    'BitUSD/mTBILL'
  ),
  new PoolConfig(
    Address.fromString('0xeb941037f8aa4ce8680666b8af62dd88b2227da2'), // wstROSE/BitUSD
    1, // BitUSD is token1
    'wstROSE/BitUSD'
  ),
  new PoolConfig(
    Address.fromString('0x419fe2b60f0ea02051b073b71f2326550d371f94'), // wROSE/BitUSD
    1, // BitUSD is token1
    'wROSE/BitUSD'
  ),
]

// Individual pool addresses for easy import
export const POOL_BITUSD_MBTILL = POOL_CONFIGS[0].address // BitUSD/mTBILL pool
export const POOL_WSTROSE_BITUSD = POOL_CONFIGS[1].address // wstROSE/BitUSD pool
export const POOL_WROSE_BITUSD = POOL_CONFIGS[2].address // wROSE/BitUSD pool

// Derived arrays for convenience
export const TARGET_POOLS: Address[] = POOL_CONFIGS.map<Address>(
  config => config.address
)
