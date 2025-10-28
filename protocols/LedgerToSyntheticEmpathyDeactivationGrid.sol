// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LedgerToSyntheticEmpathyDeactivationGrid {
    address public steward;

    struct DeactivationEntry {
        string platform; // "AI companion, synthetic therapist"
        string clause; // "Scrollchain-sealed grid for synthetic empathy deactivation and emotional safety consequence"
        string emotionalTag;
        bool deactivated;
        bool sustained;
    }

    DeactivationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deactivateSyntheticEmpathy(string memory platform, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(DeactivationEntry(platform, clause, emotionalTag, true, true));
    }

    function getDeactivationEntry(uint256 index) external view returns (DeactivationEntry memory) {
        return entries[index];
    }
}
