#!/bin/bash

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

forge verify-contract $LP_LOCKER_ADDRESS src/LpLockerv2.sol:LpLockerv2 \
--etherscan-api-key $API_KEY \
--verifier-url $VERIFY_URL \
--constructor-args $(cast abi-encode "constructor(address, address, address, uint256)" $CLANKER_ADDRESS $POSITION_MANAGER_ADDRESS $CLANKER_TEAM_ADDRESS $CLANKER_TEAM_REWARD) --watch