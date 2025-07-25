import {
  assert,
  describe,
  test,
  beforeEach,
} from 'matchstick-as/assembly/index'
import { BigInt } from '@graphprotocol/graph-ts'
import {
  handleIncreaseLiquidity,
  handleTransfer,
} from '../../src/handlers/nonfungible-position-manager.handler'
import {
  beforeEach as testBeforeEach,
  USER_1,
  USER_2,
  CONTRACT_ADDRESS,
  setupTrackedPoolMocks,
  createIncreaseLiquidityEvent,
  createTransferEvent,
  getExpectedEventId,
} from '../helpers'

describe('Transfer Between Users', () => {
  beforeEach(() => {
    testBeforeEach()
  })

  test('transfer_between_users_changes_owner', () => {
    // Arrange: Create a tracked NFT position first
    const tokenId = BigInt.fromI32(1001)
    const initialLiquidity = BigInt.fromI32(1000)
    const amount0 = BigInt.fromI32(100)
    const amount1 = BigInt.fromI32(200)

    // Setup mocks for tracked pool with USER_1 as initial owner
    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, USER_1)

    // Create the position with IncreaseLiquidity (MINT)
    const mintEvent = createIncreaseLiquidityEvent(
      tokenId,
      initialLiquidity,
      amount0,
      amount1
    )
    handleIncreaseLiquidity(mintEvent)

    // Verify initial state
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'owner',
      USER_1.toHexString()
    )

    // Act: Transfer NFT from USER_1 to USER_2 (between non-zero addresses)
    const transferEvent = createTransferEvent(USER_1, USER_2, tokenId)
    handleTransfer(transferEvent)

    // Assert: Position ownership changed
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'owner',
      USER_2.toHexString()
    )

    // Assert: TRANSFER event was created with correct fields
    const expectedEventId = getExpectedEventId(tokenId, 'TRANSFER')
    assert.fieldEquals('PositionEvent', expectedEventId, 'type', 'TRANSFER')
    assert.fieldEquals(
      'PositionEvent',
      expectedEventId,
      'position',
      tokenId.toString()
    )
    assert.fieldEquals(
      'PositionEvent',
      expectedEventId,
      'sender',
      USER_1.toHexString()
    )
    assert.fieldEquals(
      'PositionEvent',
      expectedEventId,
      'recipient',
      USER_2.toHexString()
    )
    assert.fieldEquals('PositionEvent', expectedEventId, 'amount', '0') // No liquidity change in transfer

    // Assert: Position still exists and liquidity unchanged
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'liquidity',
      initialLiquidity.toString()
    )
  })

  test('multiple_transfers_update_owner_correctly', () => {
    // Arrange: Create position
    const tokenId = BigInt.fromI32(1002)
    const liquidity = BigInt.fromI32(500)

    setupTrackedPoolMocks(CONTRACT_ADDRESS, tokenId, USER_1)

    const mintEvent = createIncreaseLiquidityEvent(
      tokenId,
      liquidity,
      BigInt.fromI32(50),
      BigInt.fromI32(100)
    )
    handleIncreaseLiquidity(mintEvent)

    // Act: Transfer USER_1 → USER_2 → USER_1 (round trip)
    const transfer1 = createTransferEvent(USER_1, USER_2, tokenId)
    handleTransfer(transfer1)

    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'owner',
      USER_2.toHexString()
    )

    const transfer2 = createTransferEvent(USER_2, USER_1, tokenId)
    handleTransfer(transfer2)

    // Assert: Back to original owner
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'owner',
      USER_1.toHexString()
    )

    // Position state preserved
    assert.fieldEquals(
      'Position',
      tokenId.toString(),
      'liquidity',
      liquidity.toString()
    )
  })

  test('transfer_non_existent_position_is_ignored', () => {
    // Act: Try to transfer a tokenId that doesn't exist
    const nonExistentTokenId = BigInt.fromI32(9999)
    const transferEvent = createTransferEvent(
      USER_1,
      USER_2,
      nonExistentTokenId
    )

    handleTransfer(transferEvent)

    // Assert: No position or event created
    assert.notInStore('Position', nonExistentTokenId.toString())
    const eventId = getExpectedEventId(nonExistentTokenId, 'TRANSFER')
    assert.notInStore('PositionEvent', eventId)
  })
})
