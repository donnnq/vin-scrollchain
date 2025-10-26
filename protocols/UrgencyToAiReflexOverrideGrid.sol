// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrgencyToAiReflexOverrideGrid {
    address public steward;

    struct ReflexEntry {
        string urgencyType; // "Falling object, sudden grief, civic chaos"
        string overrideClause; // "Scrollchain-sealed grid for reflexive AI response, emotional urgency, and planetary consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ReflexEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexReflex(string memory urgencyType, string memory overrideClause, string memory emotionalTag) external onlySteward {
        entries.push(ReflexEntry(urgencyType, overrideClause, emotionalTag, true, false));
    }

    function sealReflexEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getReflexEntry(uint256 index) external view returns (ReflexEntry memory) {
        return entries[index];
    }
}
