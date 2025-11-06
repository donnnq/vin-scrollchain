// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PriorityRoadMappingCodex {
    address public steward;

    struct PriorityEntry {
        string roadName;
        string strategicPurpose;
        string priorityLevel;
        string emotionalTag;
    }

    PriorityEntry[] public codex;

    event PriorityRoadTagged(string roadName, string strategicPurpose, string priorityLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPriority(
        string memory roadName,
        string memory strategicPurpose,
        string memory priorityLevel,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(PriorityEntry(roadName, strategicPurpose, priorityLevel, emotionalTag));
        emit PriorityRoadTagged(roadName, strategicPurpose, priorityLevel, emotionalTag);
    }
}
