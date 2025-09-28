// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import "../contracts/global/InnovationCorridorLedger.sol";

contract InnovationCorridorTest is Test {
    InnovationCorridorLedger ledger;
    address validator = address(0xB1);

    function setUp() public {
        ledger = new InnovationCorridorLedger();
        vm.prank(ledger.steward());
        ledger.setValidator(validator, true);
    }

    function testTagInnovationEvent() public {
        vm.prank(validator);
        uint256 id = ledger.tagInnovationEvent(
            "Central Luzon",
            "STEM Lab",
            "Youth Talent Activated",
            "Civic brilliance ritualized"
        );

        InnovationCorridorLedger.InnovationEvent memory eventData = ledger.getInnovationEvent(id);
        assertEq(eventData.region, "Central Luzon");
        assertEq(eventData.investmentType, "STEM Lab");
        assertEq(eventData.brillianceTrigger, "Youth Talent Activated");
        assertEq(eventData.emotionalTag, "Civic brilliance ritualized");
    }
}
