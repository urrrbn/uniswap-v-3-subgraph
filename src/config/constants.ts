import { Address } from '@graphprotocol/graph-ts'
import { PoolConfig } from '../utils/pool'

// Configuration for all tracked pools
export const POOL_CONFIGS: PoolConfig[] = [
  new PoolConfig(
    Address.fromString('0x3416cF6C708Da44DB2624D63ea0AAef7113527C6'), // usdc/usdt
    0, // BitUSD is token0
    'BitUSD/mTBILL'
  ),
  new PoolConfig(
    Address.fromString('0x5777d92f208679DB4b9778590Fa3CAB3aC9e2168'), // dai/usdc
    1, // BitUSD is token1
    'wstROSE/BitUSD'
  ),
  new PoolConfig(
    Address.fromString('0x99ac8cA7087fA4A2A1FB6357269965A2014ABc35'), // wbtc/usdc
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
