// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FamilyGriefIndex {
    address public admin;

    struct GriefEntry {
        string familyName;
        string missingRelative;
        string purokZone;
        string griefLayer; // "Unresolved Case", "Delayed Justice", "Public Silence"
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    GriefEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGrief(string memory familyName, string memory missingRelative, string memory purokZone, string memory griefLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(GriefEntry(familyName, missingRelative, purokZone, griefLayer, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealGriefEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getGriefEntry(uint256 index) external view returns (GriefEntry memory) {
        return entries[index];
    }
}
