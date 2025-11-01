// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToSanctionTriggerGrid {
    address public steward;

    struct SanctionEntry {
        string region; // "Nigeria"
        string clause; // "Scrollchain-sealed grid for sanction trigger and religious persecution consequence"
        string emotionalTag;
        bool triggered;
        bool sustained;
    }

    SanctionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function triggerSanction(string memory region, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(SanctionEntry(region, clause, emotionalTag, true, true));
    }

    function getSanctionEntry(uint256 index) external view returns (SanctionEntry memory) {
        return entries[index];
    }
}
