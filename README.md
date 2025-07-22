# Uniswap V3 Positions Subgraph

A Graph Protocol subgraph for tracking Uniswap V3 NFT position lifecycle events on Ethereum mainnet.

## 📋 Overview

This subgraph indexes and tracks:

- **NFT Position Creation**: When new Uniswap V3 positions are minted
- **Liquidity Management**: Adding and removing liquidity from positions
- **Position Transfers**: NFT ownership changes between users
- **Position Burns**: When positions are permanently destroyed

## 🏗️ Schema

### Core Entities

#### `User`

Represents wallet addresses that own or have owned positions.

```graphql
type User {
  id: Bytes! # Wallet address
  positions: [Position!]! # All positions owned by this user
}
```

#### `Position`

Represents a Uniswap V3 NFT position (ERC-721 token).

```graphql
type Position {
  id: ID! # NFT Token ID as string
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

#### `PositionEventType`

```graphql
enum PositionEventType {
  MINT # First liquidity addition to new position
  INCREASE # Additional liquidity added to existing position
  DECREASE # Liquidity removed from position
  TRANSFER # NFT ownership change
}
```

## 🔄 Event Flow

### Position Lifecycle

1. **NFT Mint**: `Transfer(0x000 → user)` → Creates position + `TRANSFER` event
2. **Add Liquidity**: `IncreaseLiquidity` → `MINT` event (first time) or `INCREASE` event
3. **Remove Liquidity**: `DecreaseLiquidity` → `DECREASE` event
4. **Transfer NFT**: `Transfer(user → user)` → `TRANSFER` event
5. **Burn NFT**: `Transfer(user → 0x000)` → `TRANSFER` event

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
```

### Production Deployment

```bash
# Authenticate with The Graph Studio
graph auth <YOUR_DEPLOY_KEY>

# Deploy to Studio
graph deploy uniswap-v3-positions
```

## 📊 Query Examples

### Get User Positions

```graphql
{
  user(id: "0x742d35cc6bb1966c1c") {
    positions {
      id
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
    liquidity
    owner {
      id
    }
  }
}
```
