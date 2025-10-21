// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SunsetOfferingCodex {
    address public admin;

    struct OfferingEntry {
        string riverZone;
        string offeringType; // "Gratitude Ritual", "Quiet Reflection", "Light Ceremony"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool practiced;
        bool sealed;
    }

    OfferingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOffering(string memory riverZone, string memory offeringType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(OfferingEntry(riverZone, offeringType, codexClause, emotionalTag, true, false, false));
    }

    function confirmPractice(uint256 index) external onlyAdmin {
        entries[index].practiced = true;
    }

    function sealOfferingEntry(uint256 index) external onlyAdmin {
        require(entries[index].practiced, "Must be practiced first");
        entries[index].sealed = true;
    }

    function getOfferingEntry(uint256 index) external view returns (OfferingEntry memory) {
        return entries[index];
    }
}
