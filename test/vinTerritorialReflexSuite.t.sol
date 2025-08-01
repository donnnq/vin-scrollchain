// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "forge-std/Test.sol";
import "../contracts/vinMaritimeDefenseScroll.sol";

contract vinTerritorialReflexSuite is Test {
    vinMaritimeDefenseScroll scroll;

    function setUp() public {
        scroll = new vinMaritimeDefenseScroll();
    }

    function testMaritimeActivation() public {
        string memory zone = "Scarborough Shoal";
        string memory result = scroll.activateMaritimeProtocol(zone);
        assertEq(result, "Defense posture activated in zone: Scarborough Shoal");
    }
}
