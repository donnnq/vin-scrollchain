// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HealingToFamilyReunionBroadcastProtocol {
    address public steward;

    struct ReunionEntry {
        string family; // "Yokota, abductee kin"
        string clause; // "Scrollchain-sealed protocol for family reunion and planetary broadcast consequence"
        string emotionalTag;
        bool healed;
        bool broadcasted;
    }

    ReunionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastReunion(string memory family, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ReunionEntry(family, clause, emotionalTag, true, true));
    }

    function getReunionEntry(uint256 index) external view returns (ReunionEntry memory) {
        return entries[index];
    }
}
