#!/bin/bash

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

forge verify-contract $CONTRACT_ADDRESS src/Clanker.sol:Clanker \
--etherscan-api-key $API_KEY \
--verifier-url $VERIFY_URL \
--constructor-args $(cast abi-encode "constructor(address, address, address, address, address)" $LOCKER $FACTORY $POSITION_MANAGER $SWAP_ROUTER $OWNER) --watch