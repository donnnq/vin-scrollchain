// SPDX-License-Identifier: Mythic-Test-License
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../contracts/labor-restoration/vinLaborReentryBroadcast.sol";

contract vinLaborReentryBroadcastTest is Test {
    vinLaborReentryBroadcast broadcast;

    function setUp() public {
        broadcast = new vinLaborReentryBroadcast();
    }

    function testBroadcastBlessing() public {
        broadcast.broadcastBlessing(
            "Althea Cruz",
            "Retail Supervisor",
            "Community Logistics Lead",
            "BayanGrid Cooperative",
            "Trust 41, Dignity 39",
            "Trust 72, Dignity 85",
            91,
            "Aug 18, 2025"
        );

        assertEq(broadcast.totalRestored(), 1);
    }
}
