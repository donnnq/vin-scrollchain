// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MigrationNarrativeContainmentTreaty {
    address public steward;

    struct NarrativeClause {
        string migrationCorridor;
        string framingType;
        string containmentMethod;
        string emotionalTag;
    }

    NarrativeClause[] public treatyLog;

    event NarrativeContained(string migrationCorridor, string framingType, string containmentMethod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function containNarrative(
        string memory migrationCorridor,
        string memory framingType,
        string memory containmentMethod,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(NarrativeClause(migrationCorridor, framingType, containmentMethod, emotionalTag));
        emit NarrativeContained(migrationCorridor, framingType, containmentMethod, emotionalTag);
    }
}
