# ERC721A NFT Collection

This repository contains a highly optimized NFT smart contract using the **ERC721A** implementation. It allows users to mint multiple NFTs in a single transaction with minimal gas cost.

## Key Features
- **Gas Optimization**: Uses ERC721A for cheap batch minting.
- **Metadata Management**: Supports `baseURI` for IPFS/Arweave metadata.
- **Withdrawal Pattern**: Secure function for the owner to withdraw ETH proceeds.
- **Supply Limits**: Enforces a maximum supply cap.

## Technology Stack
- Solidity ^0.8.19
- Hardhat
- ERC721A

## Quick Start
1. Clone the repository.
2. Install dependencies:
   ```bash
   npm install
