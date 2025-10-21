// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiverPavilionDAO {
    address public admin;

    struct PavilionEntry {
        string riverZone;
        string pavilionType; // "Cultural Stage", "Quiet Nook", "Community Deck"
        string ritualClause;
        string emotionalTag;
        bool summoned;
        bool constructed;
        bool sealed;
    }

    PavilionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPavilion(string memory riverZone, string memory pavilionType, string memory ritualClause, string memory emotionalTag) external onlyAdmin {
        entries.push(PavilionEntry(riverZone, pavilionType, ritualClause, emotionalTag, true, false, false));
    }

    function confirmConstruction(uint256 index) external onlyAdmin {
        entries[index].constructed = true;
    }

    function sealPavilionEntry(uint256 index) external onlyAdmin {
        require(entries[index].constructed, "Must be constructed first");
        entries[index].sealed = true;
    }

    function getPavilionEntry(uint256 index) external view returns (PavilionEntry memory) {
        return entries[index];
    }
}
