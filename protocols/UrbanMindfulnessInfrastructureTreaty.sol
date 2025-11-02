// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanMindfulnessInfrastructureTreaty {
    address public steward;

    struct MindfulnessClause {
        string city;
        string infrastructureType;
        string serenityOutcome;
        string emotionalTag;
    }

    MindfulnessClause[] public treatyLog;

    event MindfulnessInfrastructureTagged(string city, string infrastructureType, string serenityOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagMindfulnessInfrastructure(
        string memory city,
        string memory infrastructureType,
        string memory serenityOutcome,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(MindfulnessClause(city, infrastructureType, serenityOutcome, emotionalTag));
        emit MindfulnessInfrastructureTagged(city, infrastructureType, serenityOutcome, emotionalTag);
    }
}
