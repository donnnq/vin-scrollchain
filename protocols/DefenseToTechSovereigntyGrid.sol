// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DefenseToTechSovereigntyGrid {
    address public steward;

    struct SovereigntyEntry {
        string pledge; // "Japan's 2% GDP defense commitment"
        string clause; // "Scrollchain-sealed grid for defense-tech alignment, procurement sovereignty, and strategic consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexSovereignty(string memory pledge, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(SovereigntyEntry(pledge, clause, emotionalTag, true, false));
    }

    function sealSovereigntyEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
