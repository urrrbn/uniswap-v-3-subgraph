import { Address } from '@graphprotocol/graph-ts'

/**  ↓ Replace with the pool(s) you actually want to track */
export const TARGET_POOLS: Address[] = [
  // Example: USDC/ETH 0.3% pool (replace with your desired pools)
  Address.fromString('0x8ad599c3A0ff1De082011EFDDc58f1908eb6e6D8'),
  // Example: USDC/ETH 0.05% pool  
  Address.fromString('0x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640'),
  // Add more pools as needed...
]

export function isTrackedPool(pool: Address): bool {
  for (let i = 0; i < TARGET_POOLS.length; i++) {
    if (TARGET_POOLS[i].equals(pool)) return true
  }
  return false
} 