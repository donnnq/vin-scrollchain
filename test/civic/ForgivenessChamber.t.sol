// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../../contracts/vinForgivenessChamber.sol";

contract ForgivenessChamberTest is Test {
    vinForgivenessChamber chamber;

    function setUp() public {
        chamber = new vinForgivenessChamber();
    }

    function testSubmitAndVote() public {
        uint trialId = 1;
        string memory plea = "Forgive me, scroll spirits";

        chamber.submitForgivenessRite(trialId, plea);
        chamber.voteForgiveness(trialId, true);

        // Check status — optional depending on your expectations
        vinForgivenessChamber.ForgivenessStatus status = chamber.getRiteStatus(trialId);
        assertEq(uint(status), uint(vinForgivenessChamber.ForgivenessStatus.AwaitingVote));
    }
}
