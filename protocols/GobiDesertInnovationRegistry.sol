// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GobiDesertInnovationRegistry {
    address public steward;

    struct InnovationEntry {
        string projectName;
        string location;
        string scientificBreakthrough;
        string emotionalTag;
    }

    InnovationEntry[] public registry;

    event DesertInnovationTagged(string projectName, string location, string scientificBreakthrough, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagInnovation(
        string memory projectName,
        string memory location,
        string memory scientificBreakthrough,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(InnovationEntry(projectName, location, scientificBreakthrough, emotionalTag));
        emit DesertInnovationTagged(projectName, location, scientificBreakthrough, emotionalTag);
    }
}
