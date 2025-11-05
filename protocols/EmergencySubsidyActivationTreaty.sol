// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmergencySubsidyActivationTreaty {
    address public steward;

    struct ActivationClause {
        string barangay;
        string commodity;
        string subsidyTrigger;
        string emotionalTag;
    }

    ActivationClause[] public treatyLog;

    event EmergencySubsidyActivated(string barangay, string commodity, string subsidyTrigger, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function activateSubsidy(
        string memory barangay,
        string memory commodity,
        string memory subsidyTrigger,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ActivationClause(barangay, commodity, subsidyTrigger, emotionalTag));
        emit EmergencySubsidyActivated(barangay, commodity, subsidyTrigger, emotionalTag);
    }
}
