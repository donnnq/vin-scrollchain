// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../../contracts/vinSenatorBadgeRelay.sol";

contract SenatorBadgeRelayTest is Test {
    vinSenatorBadgeRelay relay;

    function setUp() public {
        relay = new vinSenatorBadgeRelay();
    }

    function testAssignAndVerifyBadge() public {
        relay.assignBadge(address(this), "senator");
        assertEq(relay.getBadge(address(this)), "senator");
    }
}
