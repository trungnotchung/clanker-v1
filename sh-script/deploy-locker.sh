#deploy contract token
#!/bin/bash

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

forge create src/LpLockerv2.sol:LpLockerv2 \
--rpc-url $RPC_URL \
--private-key $PRIVATE_KEY \
--constructor-args $CLANKER_ADDRESS $POSITION_MANAGER_ADDRESS $CLANKER_TEAM_ADDRESS $CLANKER_TEAM_REWARD