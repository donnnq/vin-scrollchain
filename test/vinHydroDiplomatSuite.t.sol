// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "forge-std/Test.sol";
import "../contracts/vinHydroDiplomat.sol";

contract vinHydroDiplomatSuite is Test {
    vinHydroDiplomat diplomat;

    function setUp() public {
        diplomat = new vinHydroDiplomat();
    }

    function testInitialCalmZone() public {
        diplomat.logZoneReport("Benham Rise", 20);
        string memory action = diplomat.recommendAction("Benham Rise");
        assertEq(action, "Zone is calm. No diplomatic action required.");
    }

    function testRisingTensions() public {
        diplomat.logZoneReport("Panatag Shoal", 65);
        string memory action = diplomat.recommendAction("Panatag Shoal");
        assertEq(action, "Initiate dialogue. Tensions manageable with soft rituals.");
    }

    function testFinalStrikeTriggersMediation() public {
        diplomat.logZoneReport("Panatag Shoal", 91);
        string memory action = diplomat.recommendAction("Panatag Shoal");
        assertEq(action, "Deploy aqua mediators immediately to prevent escalation.");
    }
}
