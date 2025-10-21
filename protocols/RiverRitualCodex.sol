// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiverRitualCodex {
    address public admin;

    struct RitualEntry {
        string riverZone;
        string ritualType; // "Sunset Walk", "Water Offering", "Quiet Gathering"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool practiced;
        bool sealed;
    }

    RitualEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRitual(string memory riverZone, string memory ritualType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RitualEntry(riverZone, ritualType, codexClause, emotionalTag, true, false, false));
    }

    function confirmPractice(uint256 index) external onlyAdmin {
        entries[index].practiced = true;
    }

    function sealRitualEntry(uint256 index) external onlyAdmin {
        require(entries[index].practiced, "Must be practiced first");
        entries[index].sealed = true;
    }

    function getRitualEntry(uint256 index) external view returns (RitualEntry memory) {
        return entries[index];
    }
}
