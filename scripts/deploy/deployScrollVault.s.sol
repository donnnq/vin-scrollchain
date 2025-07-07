// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import { VinScrollVault } from "contracts/core/vin-scrollvault.sol";

contract DeployScrollVault is Script {
    function run() external {
        vm.startBroadcast();
        VinScrollVault vault = new VinScrollVault();
        console.log("✅ ScrollVault deployed at:", address(vault));
        vm.stopBroadcast();
    }
}
