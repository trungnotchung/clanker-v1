pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";
import {Clanker} from "../src/Clanker.sol";
import {console} from "forge-std/console.sol";

contract ClankerTest is Test {
    address constant LP_LOCKER_ADDRESS =
        0x5eC4f99F342038c67a312a166Ff56e6D70383D86;
    address constant UNISWAPV3_ADDRESS =
        0x33128a8fC17869897dcE68Ed026d694621f6FDfD;
    address constant POSITION_MANAGER_ADDRESS =
        0x03a520b32C04BF3bEEf7BEb72E919cf822Ed34f1;
    address constant SWAP_ROUTER_ADDRESS =
        0x2626664c2603336E57B271c5C0b26F421741e481;
    address constant OWNER = 0xC1b1729127E4029174F183aB51a4B10c58Dc006d;

    Clanker clanker;

    function setUp() public {
        clanker = new Clanker{
            salt: keccak256(
                abi.encode("0xC1b1729127E4029174F183aB51a4B10c58Dc006d")
            )
        }(
            LP_LOCKER_ADDRESS,
            UNISWAPV3_ADDRESS,
            POSITION_MANAGER_ADDRESS,
            SWAP_ROUTER_ADDRESS,
            address(this)
        );
        clanker.setAdmin(OWNER, true);
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
            0xb64ad73e9d1a214027ab1686c16dcd175e06ca2110920a5439e4553519e742b3,
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
