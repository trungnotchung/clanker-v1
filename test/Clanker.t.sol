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
        0x59979986B39245FbE1A4219B54848e542B5f2355;
    address constant CLANKER_TEAM_ADDRESS =
        0x7372d36388E5e7d2cf7B3B9b4dB106D442F9a1a7;
    uint256 constant CLANKER_TEAM_REWARD = 60;

    Clanker clanker;
    LpLockerv2 lpLocker;

    function setUp() public {
        vm.startBroadcast(OWNER);
        lpLocker = new LpLockerv2{
            salt: keccak256(
                abi.encode("0x7372d36388E5e7d2cf7B3B9b4dB106D442F9a1a7")
            )
        }(
            CLANKER_ADDRESS,
            POSITION_MANAGER_ADDRESS,
            CLANKER_TEAM_ADDRESS,
            CLANKER_TEAM_REWARD
        );

        clanker = new Clanker{
            salt: keccak256(
                abi.encode("0x7372d36388E5e7d2cf7B3B9b4dB106D442F9a1a7")
            )
        }(
            address(lpLocker),
            UNISWAPV3_ADDRESS,
            POSITION_MANAGER_ADDRESS,
            SWAP_ROUTER_ADDRESS,
            OWNER
        );
        lpLocker.updateClankerFactory(address(clanker));
        console.log("Clanker address: ", address(clanker));
        clanker.toggleAllowedPairedToken(
            0x4200000000000000000000000000000000000006,
            true
        );
    }

    function testDeploy() public {
        (, uint256 positionId) = clanker.deployToken(
            "Test Token",
            "Test Symbol",
            1000000000,
            10000,
            0xfd64a4064216e669183f9fd239f674557f855b54c9a7fe22761517c87123b69b,
            OWNER,
            0,
            "haha",
            "0x7949590b65138ed6736e5e5acc1881f8b9ccc559",
            Clanker.PoolConfig({
                tick: -230400,
                pairedToken: 0x4200000000000000000000000000000000000006,
                devBuyFee: 10000
            })
        );

        console.log("Position ID: ", positionId);
    }
}
