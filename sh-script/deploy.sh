#deploy contract token
#!/bin/bash

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

forge create src/Clanker.sol:Clanker \
--rpc-url $RPC_URL \
--private-key $PRIVATE_KEY \
--constructor-args $LP_LOCKER_ADDRESS $FACTORY_ADDRESS $POSITION_MANAGER_ADDRESS $SWAP_ROUTER_ADDRESS $OWNER_ADDRESS