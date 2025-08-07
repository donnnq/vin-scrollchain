// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../../contracts/vinCivicVerdictEngine.sol";

contract VerdictEngineTest is Test {
    vinCivicVerdictEngine engine;

    function setUp() public {
        engine = new vinCivicVerdictEngine();
    }

    function testInitialVerdictState() public {
        assertEq(engine.getVerdictStatus(), 0);
    }

    function testUpdateVerdict() public {
        engine.setVerdictStatus(2);
        assertEq(engine.getVerdictStatus(), 2);
    }
}
