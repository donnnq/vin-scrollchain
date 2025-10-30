// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToFISHUtilitySimulationGrid {
    address public steward;

    struct FishEntry {
        string utility; // "Governance, Karma Multiplier, Chapter Access, NFT Crafting"
        string clause; // "Scrollchain-sealed grid for $FISH utility simulation and bait consequence"
        string emotionalTag;
        bool simulated;
        bool activated;
    }

    FishEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function simulateUtility(string memory utility, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(FishEntry(utility, clause, emotionalTag, true, false));
    }

    function activateUtility(uint256 index) external onlySteward {
        entries[index].activated = true;
    }

    function getFishEntry(uint256 index) external view returns (FishEntry memory) {
        return entries[index];
    }
}
