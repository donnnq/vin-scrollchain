// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SleeperVillageDAO {
    address public admin;

    struct SleeperEntry {
        string location;
        string eventTrigger; // "F1 Weekend", "Price Surge", "Hotel Shortage"
        string shelterType; // "Airport Lounge", "Gate Bench", "Transit Zone"
        string emotionalTag;
        bool summoned;
        bool occupied;
        bool sealed;
    }

    SleeperEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSleeper(string memory location, string memory eventTrigger, string memory shelterType, string memory emotionalTag) external onlyAdmin {
        entries.push(SleeperEntry(location, eventTrigger, shelterType, emotionalTag, true, false, false));
    }

    function confirmOccupation(uint256 index) external onlyAdmin {
        entries[index].occupied = true;
    }

    function sealSleeperEntry(uint256 index) external onlyAdmin {
        require(entries[index].occupied, "Must be occupied first");
        entries[index].sealed = true;
    }

    function getSleeperEntry(uint256 index) external view returns (SleeperEntry memory) {
        return entries[index];
    }
}
