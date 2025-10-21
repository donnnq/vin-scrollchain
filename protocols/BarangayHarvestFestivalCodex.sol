// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayHarvestFestivalCodex {
    address public admin;

    struct FestivalEntry {
        string barangay;
        string ritualType; // "Egg Parade", "Tilapia Cook-off", "Compost Ceremony", "Youth Farmer Awards"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool celebrated;
        bool sealed;
    }

    FestivalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFestival(string memory barangay, string memory ritualType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(FestivalEntry(barangay, ritualType, codexClause, emotionalTag, true, false, false));
    }

    function confirmCelebration(uint256 index) external onlyAdmin {
        entries[index].celebrated = true;
    }

    function sealFestivalEntry(uint256 index) external onlyAdmin {
        require(entries[index].celebrated, "Must be celebrated first");
        entries[index].sealed = true;
    }

    function getFestivalEntry(uint256 index) external view returns (FestivalEntry memory) {
        return entries[index];
    }
}
