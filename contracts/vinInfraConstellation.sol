// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./vinGridRebirth.sol";
import "./vinTransitPulse.sol";
import "./vinWaterSanctum.sol";
import "./vinBroadbandBridge.sol";
import "./vinHealthReach.sol";
import "./vinCommonsForge.sol";

contract vinInfraConstellation {
    vinGridRebirth public grid;
    vinTransitPulse public transit;
    vinWaterSanctum public water;
    vinBroadbandBridge public broadband;
    vinHealthReach public health;
    vinCommonsForge public commons;

    constructor(
        address gridAddr,
        address transitAddr,
        address waterAddr,
        address broadbandAddr,
        address healthAddr,
        address commonsAddr
    ) {
        grid = vinGridRebirth(gridAddr);
        transit = vinTransitPulse(transitAddr);
        water = vinWaterSanctum(waterAddr);
        broadband = vinBroadbandBridge(broadbandAddr);
        health = vinHealthReach(healthAddr);
        commons = vinCommonsForge(commonsAddr);
    }

    function infraGenesis() public pure returns (string memory) {
        return "The scrollchain of dignity is deployed. All citizens shall now flourish.";
    }
}
