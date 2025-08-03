// SPDX-License-Identifier: Fuzz-Test
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../contracts/vinProtocolIsolationAura.sol";

contract vinBlacklistWatcherTest is Test {
    vinProtocolIsolationAura aura;

    function setUp() public {
        aura = new vinProtocolIsolationAura();
    }

    function testInitialBlacklistEmpty() public view {
        assertEq(aura.blacklistedRegions("China"), false);
        assertEq(aura.blacklistedRegions("Russia"), false);
    }

    function testBlacklistBothRegions() public {
        aura.blacklistRegion("China");
        aura.blacklistRegion("Russia");

        assertTrue(aura.blacklistedRegions("China"));
        assertTrue(aura.blacklistedRegions("Russia"));
    }

    function testRegionsStayBlacklisted() public {
        aura.blacklistRegion("China");
        aura.blacklistRegion("Russia");

        skip(1 hours); // symbolic passage of time

        assertTrue(aura.blacklistedRegions("China"));
        assertTrue(aura.blacklistedRegions("Russia"));
    }

    function testNoUnblacklistAllowedByDefault() public {
        aura.blacklistRegion("China");
        aura.blacklistRegion("Russia");

        vm.expectRevert("Region not blacklisted");
        aura.unblacklistRegion("Atlantis"); // Unlisted → triggers revert

        vm.expectRevert("Region not blacklisted");
        aura.unblacklistRegion("Lemuria"); // Unlisted → triggers revert
    }

    function testFuzzBlacklist(string memory region) public {
        vm.assume(bytes(region).length > 0);
        aura.blacklistRegion(region);
        assertTrue(aura.blacklistedRegions(region));
    }
}
