pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";
import {Clanker} from "../src/Clanker.sol";
import {LpLockerv2} from "../src/LpLockerv2.sol";
import {console} from "forge-std/console.sol";

contract ClankerTest is Test {
    address constant UNISWAPV3_ADDRESS =
        0x33128a8fC17869897dcE68Ed026d694621f6FDfD;
    address constant POSITION_MANAGER_ADDRESS =
        0x03a520b32C04BF3bEEf7BEb72E919cf822Ed34f1;
    address constant SWAP_ROUTER_ADDRESS =
        0x2626664c2603336E57B271c5C0b26F421741e481;
    address constant OWNER = 0x7372d36388E5e7d2cf7B3B9b4dB106D442F9a1a7;
    address constant CLANKER_ADDRESS =
        0x4672EBd5296870056f8E825e8f1087e20AA7F2BA;
    address constant CLANKER_TEAM_ADDRESS =
        0x7372d36388E5e7d2cf7B3B9b4dB106D442F9a1a7;
    uint256 constant CLANKER_TEAM_REWARD = 60;

    Clanker clanker;
    LpLockerv2 lpLocker;

    function setUp() public {
        clanker = Clanker(0x4672EBd5296870056f8E825e8f1087e20AA7F2BA);
        lpLocker = LpLockerv2(0x3634E4810a0ed0f649079A9d479b2CbCC312d7BF);
    }

    function testDeploy() public {
        vm.startBroadcast(OWNER);
        address owner = clanker.owner();
        console.log("owner", owner);
        console.log("factory", lpLocker._factory());
        (, uint256 positionId) = clanker.deployToken(
            "Test Token",
            "Test Symbol",
            1000000000000000000,
            10000,
            0x3dd19da992fefacaad68bbdcb7f337d1c46239a77656e75bb6eb6f47279d3491,
            OWNER,
            0,
            "haha",
            "clanker",
            Clanker.PoolConfig({
                tick: -230400,
                pairedToken: 0x4200000000000000000000000000000000000006,
                devBuyFee: 10000
            })
        );

        // console.log("Position ID: ", positionId);
        vm.stopBroadcast();
    }
}
