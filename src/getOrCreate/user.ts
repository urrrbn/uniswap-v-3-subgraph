import { BigInt, Bytes } from '@graphprotocol/graph-ts'
import { User } from '../../generated/schema'

/**
 * Load or create a User entity
 * Used across multiple handlers to ensure consistent user creation
 */
export function getOrCreateUser(address: Bytes): User {
  let user = User.load(address)
  if (user == null) {
    user = new User(address)
    user.totalBitUSDVolume = BigInt.zero()
    user.lastPurchaseTimestamp = BigInt.zero()
    user.save()
  }
  return user
}

