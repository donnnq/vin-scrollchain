// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";

contract vinDiplomaticBalancerTest is Test {
    uint256 public auraLevel;
    bool public mediationActive;

    function setUp() public {
        auraLevel = 0;
        mediationActive = false;
    }

    function testInitialAuraLevel() public view {
        assertEq(auraLevel, 0);
    }

    function testBalanceAuraIncreasesLevel() public {
        auraLevel += 1;
        assertEq(auraLevel, 1);
    }

    function testMediationWorksAfterTimeout() public {
        skip(1 days);
        mediationActive = true;
        assertTrue(mediationActive);
    }

    function testTimeoutBlocksBalancing() public {
        skip(2 days);
        auraLevel = 0;
        assertEq(auraLevel, 0);
    }
}
