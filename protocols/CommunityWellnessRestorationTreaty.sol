// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityWellnessRestorationTreaty {
    address public steward;

    struct WellnessClause {
        string barangay;
        string wellnessAction;
        string restorationOutcome;
        string emotionalTag;
    }

    WellnessClause[] public treatyLog;

    event WellnessRestored(string barangay, string wellnessAction, string restorationOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function restoreWellness(
        string memory barangay,
        string memory wellnessAction,
        string memory restorationOutcome,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(WellnessClause(barangay, wellnessAction, restorationOutcome, emotionalTag));
        emit WellnessRestored(barangay, wellnessAction, restorationOutcome, emotionalTag);
    }
}
