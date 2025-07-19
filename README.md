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
  id: Bytes!                    # Wallet address
  positions: [Position!]!       # All positions owned by this user
}
```

#### `Position` 
Represents a Uniswap V3 NFT position (ERC-721 token).
```graphql
type Position {
  id: ID!                       # NFT Token ID as string
  owner: User!                  # Current owner wallet
  createdAt: BigInt!            # Block timestamp when first liquidity added
  liquidity: BigInt!            # Current liquidity amount
  events: [PositionEvent!]!     # All events for this position
}
```

#### `PositionEvent`
Immutable event log of all position activities.
```graphql
type PositionEvent {
  id: ID!                       # Unique event ID
  position: Position!           # Associated position
  type: PositionEventType!      # Event type
  txHash: Bytes!               # Transaction hash
  timestamp: BigInt!           # Block timestamp
  blockNumber: BigInt!         # Block number
  amount: BigInt!              # Liquidity delta
  amount0: BigInt!             # Token0 amount change
  amount1: BigInt!             # Token1 amount change
  sender: Bytes!               # Transaction sender
  recipient: Bytes             # Event recipient (for transfers)
}
```

#### `PositionEventType`
```graphql
enum PositionEventType {
  MINT        # First liquidity addition to new position
  INCREASE    # Additional liquidity added to existing position
  DECREASE    # Liquidity removed from position
  TRANSFER    # NFT ownership change
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
    id
    positions {
      id
      liquidity
      createdAt
      events(first: 5, orderBy: timestamp, orderDirection: desc) {
        type
        amount
        timestamp
      }
    }
  }
}
```

### Recent Position Events
```graphql
{
  positionEvents(
    first: 10
    orderBy: timestamp
    orderDirection: desc
  ) {
    id
    type
    amount
    position {
      id
      owner { id }
    }
    txHash
    timestamp
  }
}
```

### Active Positions (with liquidity)
```graphql
{
  positions(
    where: { liquidity_gt: "0" }
    first: 50
    orderBy: liquidity
    orderDirection: desc
  ) {
    id
    liquidity
    owner { id }
    createdAt
  }
}
```

### Filter by Event Type
```graphql
{
  positionEvents(
    where: { type: MINT }
    first: 20
    orderBy: timestamp
    orderDirection: desc
  ) {
    id
    amount
    position {
      id
      owner { id }
    }
    timestamp
  }
}
```

### Position Event History
```graphql
{
  position(id: "123456") {
    id
    liquidity
    owner { id }
    events(orderBy: timestamp) {
      type
      amount
      amount0
      amount1
      timestamp
      txHash
    }
  }
}
```

## 🔧 Backend Integration

### TypeScript/JavaScript
```typescript
import { request, gql } from 'graphql-request'

const endpoint = 'https://api.studio.thegraph.com/query/116376/uniswap-v-3-positions/v0.0.8'

// Get user positions
const getUserPositions = async (userAddress: string) => {
  const query = gql`
    query GetUserPositions($user: String!) {
      user(id: $user) {
        positions {
          id
          liquidity
          events(first: 10, orderBy: timestamp, orderDirection: desc) {
            type
            amount
            timestamp
          }
        }
      }
    }
  `
  
  return request(endpoint, query, { user: userAddress.toLowerCase() })
}

// Track new positions
const getRecentMints = async (since: number) => {
  const query = gql`
    query GetRecentMints($since: BigInt!) {
      positionEvents(
        where: { type: MINT, timestamp_gte: $since }
        orderBy: timestamp
        orderDirection: desc
      ) {
        position {
          id
          owner { id }
          liquidity
        }
        amount
        timestamp
        txHash
      }
    }
  `
  
  return request(endpoint, query, { since: since.toString() })
}
```
