// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicSpaceFestivalCodex {
    address public admin;

    struct FestivalEntry {
        string plazaName;
        string festivalType; // "Lighting Ceremony", "Cultural Parade", "Food Bazaar"
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

    function summonFestival(string memory plazaName, string memory festivalType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(FestivalEntry(plazaName, festivalType, codexClause, emotionalTag, true, false, false));
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
