# Uniswap V3 Positions & BitUSD Purchase Tracking Subgraph

## 📋 Overview

This subgraph indexes and tracks:

- **NFT Position Creation**: When new Uniswap V3 positions are minted
- **Liquidity Management**: Adding and removing liquidity from positions
- **Position Transfers**: NFT ownership changes between users
- **Position Burns**: When positions are permanently destroyed
- **BitUSD Purchase Tracking**: Monitors BitUSD purchases across supported pools with volume tracking

## 🏗️ Schema

### Core Entities

#### `User`

Represents wallet addresses that own or have owned positions, with BitUSD purchase tracking.

```graphql
type User {
  id: Bytes! # Wallet address
  positions: [Position!]! # All positions owned by this user
  bitUSDPurchases: [BitUSDPurchase!]! # All BitUSD purchases by this user
  totalBitUSDVolume: BigInt! # Total BitUSD purchased by this user
  lastPurchaseTimestamp: BigInt! # Last time user purchased BitUSD
}
```

#### `Position`

Represents a Uniswap V3 NFT position (ERC-721 token).

```graphql
type Position {
  id: ID! # NFT Token ID as string
  pool: Bytes! # Pool address where position exists
  owner: User! # Current owner wallet
  createdAt: BigInt! # Block timestamp when first liquidity added
  liquidity: BigInt! # Current liquidity amount
  events: [PositionEvent!]! # All events for this position
}
```

#### `PositionEvent`

Immutable event log of all position activities.

```graphql
type PositionEvent {
  id: ID! # Unique event ID
  position: Position! # Associated position
  type: PositionEventType! # Event type
  txHash: Bytes! # Transaction hash
  timestamp: BigInt! # Block timestamp
  blockNumber: BigInt! # Block number
  amount: BigInt! # Liquidity delta
  amount0: BigInt! # Token0 amount change
  amount1: BigInt! # Token1 amount change
  sender: Bytes! # Transaction sender
  recipient: Bytes # Event recipient (for transfers)
}
```

#### `BitUSDPurchase`

Tracks all BitUSD purchase transactions across monitored pools.

```graphql
type BitUSDPurchase {
  id: ID! # Unique purchase ID (txHash-logIndex)
  pool: Bytes! # Pool where purchase occurred
  user: User! # User who made the purchase
  sender: Bytes! # Transaction sender (often router)
  recipient: Bytes! # Transaction recipient
  bitUSDAmount: BigInt! # Amount of BitUSD purchased (always positive)
  otherTokenAmount: BigInt! # Amount of other token sold (always positive)
  txHash: Bytes! # Transaction hash
  timestamp: BigInt! # Block timestamp
  blockNumber: BigInt! # Block number
  logIndex: BigInt! # Log index in transaction
}
```

#### `PositionEventType`

```graphql
enum PositionEventType {
  MINT # First liquidity addition to new position
  INCREASE # Additional liquidity added to existing position
  DECREASE # Liquidity removed from position
  TRANSFER # NFT ownership change
}
```

## 🏊 Supported Pools

The subgraph currently tracks BitUSD purchases from:

- **BitUSD/mTBILL** (0.3% fee) - BitUSD as token0
- **wstROSE/BitUSD** (0.03% fee) - BitUSD as token1 *(commented out)*
- **wROSE/BitUSD** (0.03% fee) - BitUSD as token1 *(commented out)*

## 🔄 Event Flow

### Position Lifecycle

1. **NFT Mint**: `Transfer(0x000 → user)` → Creates position + `TRANSFER` event
2. **Add Liquidity**: `IncreaseLiquidity` → `MINT` event (first time) or `INCREASE` event
3. **Remove Liquidity**: `DecreaseLiquidity` → `DECREASE` event
4. **Transfer NFT**: `Transfer(user → user)` → `TRANSFER` event
5. **Burn NFT**: `Transfer(user → 0x000)` → `TRANSFER` event

### BitUSD Purchase Flow

1. **Swap Event**: User swaps tokens for BitUSD in a tracked pool
2. **Purchase Detection**: Handler validates if swap is buying BitUSD
3. **Entity Creation**: Creates `BitUSDPurchase` record
4. **User Update**: Updates user's total volume and last purchase timestamp

## 🚀 Quick Start

### Prerequisites

- Node.js & npm/yarn
- Graph CLI: `npm install -g @graphprotocol/graph-cli`

### Setup

```bash
# Clone and install dependencies
git clone <your-repo>
cd uniswap-v-3-subgraph
npm install

# Generate types
graph codegen

# Build subgraph
graph build

# Run tests
graph test

# Type check
npm run type-check
```

### Production Deployment

```bash
# Authenticate with The Graph Studio
graph auth <YOUR_DEPLOY_KEY>

# Deploy to Studio
graph deploy uniswap-v-3-positions
```

## 📊 Query Examples

### Get User Positions

```graphql
{
  user(id: "0x742d35cc6bb1966c1c") {
    positions {
      id
      pool
      liquidity
      createdAt
    }
  }
}
```

### Recent Position Events

```graphql
{
  positionEvents(first: 10, orderBy: timestamp, orderDirection: desc) {
    id
    type
    amount
    position {
      id
      pool
    }
    timestamp
  }
}
```

### Active Positions

```graphql
{
  positions(where: { liquidity_gt: "0" }, first: 50) {
    id
    pool
    liquidity
    owner {
      id
    }
  }
}
```

### User BitUSD Purchases

```graphql
{
  user(id: "0x742d35cc6bb1966c1c") {
    totalBitUSDVolume
    lastPurchaseTimestamp
    bitUSDPurchases(first: 10, orderBy: timestamp, orderDirection: desc) {
      id
      bitUSDAmount
      otherTokenAmount
      pool
      timestamp
    }
  }
}
```

### Recent BitUSD Purchases

```graphql
{
  bitUSDPurchases(first: 20, orderBy: timestamp, orderDirection: desc) {
    id
    pool
    user {
      id
    }
    bitUSDAmount
    otherTokenAmount
    timestamp
  }
}
```

### Top BitUSD Buyers

```graphql
{
  users(
    where: { totalBitUSDVolume_gt: "0" }
    orderBy: totalBitUSDVolume
    orderDirection: desc
    first: 10
  ) {
    id
    totalBitUSDVolume
    lastPurchaseTimestamp
    bitUSDPurchases {
      id
    }
  }
}
```

### BitUSD Purchases by Pool

```graphql
{
  bitUSDPurchases(
    where: { pool: "0x33cFE8f63518Dc43798B6BC0009a42c73D87B0Cf" }
    first: 50
    orderBy: timestamp
    orderDirection: desc
  ) {
    id
    user {
      id
    }
    bitUSDAmount
    timestamp
  }
}
```
