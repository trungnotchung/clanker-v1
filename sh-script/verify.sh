#!/bin/bash

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

forge verify-contract $CLANKER_ADDRESS src/Clanker.sol:Clanker \
--etherscan-api-key $API_KEY \
--verifier-url $VERIFY_URL \
--constructor-args $(cast abi-encode "constructor(address, address, address, address, address)" $LOCKER_ADDRESS $FACTORY_ADDRESS $POSITION_MANAGER_ADDRESS $SWAP_ROUTER_ADDRESS $OWNER_ADDRESS) --watch