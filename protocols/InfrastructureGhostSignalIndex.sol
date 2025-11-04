// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureGhostSignalIndex {
    address public steward;

    struct GhostSignalEntry {
        string projectName;
        string location;
        string ghostSignal;
        string emotionalTag;
    }

    GhostSignalEntry[] public index;

    event GhostSignalIndexed(string projectName, string location, string ghostSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexGhostSignal(
        string memory projectName,
        string memory location,
        string memory ghostSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(GhostSignalEntry(projectName, location, ghostSignal, emotionalTag));
        emit GhostSignalIndexed(projectName, location, ghostSignal, emotionalTag);
    }
}
