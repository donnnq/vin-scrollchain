// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../contracts/infra/vin-scrollinfra-traffic.sol";

contract VaultChainInfraTest is Test {
    VaultChainInfra infra;

    function setUp() public {
        infra = new VaultChainInfra();
    }

    function testPlannerIsDeployer() public view {
        assertEq(infra.planner(), address(this));
    }

    function testToggleCrosswalk() public {
        bool initial = infra.emotionalCrosswalkActive();
        infra.toggleCrosswalk();
        assertEq(infra.emotionalCrosswalkActive(), !initial);
    }

    function testPedestrianCross() public {
        infra.activatePedestrianMode(address(this));
        string memory message = infra.crossRoad();
        assertEq(message, "Crosswalk ritual passed. Emotional APR stabilized.");
    }
}
