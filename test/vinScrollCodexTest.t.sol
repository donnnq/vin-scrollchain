// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../contracts/vin-scrollcodex.sol";

contract vinScrollCodexTest is Test {
    vinScrollCodex codex;

    function setUp() public {
        codex = new vinScrollCodex();
    }

    function testRegisterScroll() public {
        codex.registerScroll(
            "vin-scrollinfra-traffic", "Chain zoning protocol with emotional crosswalks", "infra", address(0x123)
        );

        vinScrollCodex.Scroll memory s = codex.getScroll(0);
        assertEq(s.name, "vin-scrollinfra-traffic");
        assertEq(s.zone, "infra");
        assertEq(s.deployedAt, address(0x123));
    }

    function testTaggingScroll() public {
        codex.registerScroll("vin-scrollinfra-vulnmapping", "Data breach tracker", "infra", address(0x456));
        string[] memory tags = new string[](2);
        tags[0] = "analytics";
        tags[1] = "security";

        codex.tagScroll(0, tags);
        string[] memory fetched = codex.getTags(0);
        assertEq(fetched[0], "analytics");
        assertEq(fetched[1], "security");
    }
}
