// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicRecreationEthicsCodex {
    address public steward;

    struct RecreationClause {
        string location;
        string activityType;
        string ethicalGuideline;
        string emotionalTag;
    }

    RecreationClause[] public codex;

    event RecreationTagged(string location, string activityType, string ethicalGuideline, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagRecreation(
        string memory location,
        string memory activityType,
        string memory ethicalGuideline,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(RecreationClause(location, activityType, ethicalGuideline, emotionalTag));
        emit RecreationTagged(location, activityType, ethicalGuideline, emotionalTag);
    }
}
