// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../../contracts/vinRedemptionPathway.sol";

contract RedemptionPathwayTest is Test {
    vinRedemptionPathway pathway;

    function setUp() public {
        pathway = new vinRedemptionPathway();
    }

    function testSubmitRedemption() public {
        string memory msgText = "Forgive me, DAO scroll spirits";
        uint256 trialId = 1;

        pathway.submitRedemption(trialId, msgText);

        (bool accepted, string memory message, address respondent) = pathway.getPleaStatus(trialId);

        assertEq(accepted, false); // Not evaluated yet
        assertEq(message, msgText);
        assertEq(respondent, address(this));
    }
}
