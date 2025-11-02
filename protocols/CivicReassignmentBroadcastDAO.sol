// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicReassignmentBroadcastDAO {
    address public steward;

    struct BroadcastEntry {
        string officialName;
        string newCorridor;
        string reassignmentType;
        string emotionalTag;
    }

    BroadcastEntry[] public registry;

    event ReassignmentBroadcasted(string officialName, string newCorridor, string reassignmentType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastReassignment(
        string memory officialName,
        string memory newCorridor,
        string memory reassignmentType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BroadcastEntry(officialName, newCorridor, reassignmentType, emotionalTag));
        emit ReassignmentBroadcasted(officialName, newCorridor, reassignmentType, emotionalTag);
    }
}
