// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../contracts/rituals/vin-scrollDiplomaticBalancer.sol";

contract vinDiplomaticBalancerTest is Test {
    DiplomaticBalancer balancer;

    address alice = address(0xA11CE);
    address bob = address(0xB0B);

    function setUp() public {
        balancer = new DiplomaticBalancer();
        vm.prank(address(this));
    }

    function testInitialAuraLevel() public {
        assertEq(balancer.auraLevel(alice), 0);
    }

    function testBalanceAuraIncreasesLevel() public {
        balancer.balanceAura(alice);
        assertEq(balancer.auraLevel(alice), 1);
    }

    function testTimeoutBlocksBalancing() public {
        balancer.applyTimeout(alice, 10);
        vm.expectRevert("Entity is in cooldown.");
        balancer.balanceAura(alice);
    }

    function testMediationWorksAfterTimeout() public {
        vm.warp(block.timestamp + 600); // fast forward 10 minutes
        balancer.mediateConflict(alice, bob);
        assertEq(balancer.auraLevel(alice), 1);
        assertEq(balancer.auraLevel(bob), 1);
    }
}
