// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StrategicReassignmentEthicsCodex {
    address public steward;

    struct ReassignmentClause {
        string officialName;
        string newCorridor;
        string reassignmentType;
        string emotionalTag;
    }

    ReassignmentClause[] public codex;

    event ReassignmentTagged(string officialName, string newCorridor, string reassignmentType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagReassignment(
        string memory officialName,
        string memory newCorridor,
        string memory reassignmentType,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ReassignmentClause(officialName, newCorridor, reassignmentType, emotionalTag));
        emit ReassignmentTagged(officialName, newCorridor, reassignmentType, emotionalTag);
    }
}
