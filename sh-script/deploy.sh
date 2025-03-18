#deploy contract token
#!/bin/bash

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

forge create src/Clanker.sol:Clanker \
--rpc-url $RPC_URL \
--private-key $PRIVATE_KEY \
--constructor-args $LOCKER $FACTORY $POSITION_MANAGER $SWAP_ROUTER $OWNER