// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayGriefCodex {
    address public admin;

    struct GriefEntry {
        string barangayName;
        string griefType;
        string supportClause;
        string emotionalTag;
        bool summoned;
        bool acknowledged;
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

    function summonGrief(string memory barangayName, string memory griefType, string memory supportClause, string memory emotionalTag) external onlyAdmin {
        entries.push(GriefEntry(barangayName, griefType, supportClause, emotionalTag, true, false, false));
    }

    function confirmAcknowledgement(uint256 index) external onlyAdmin {
        entries[index].acknowledged = true;
    }

    function sealGriefEntry(uint256 index) external onlyAdmin {
        require(entries[index].acknowledged, "Must be acknowledged first");
        entries[index].sealed = true;
    }

    function getGriefEntry(uint256 index) external view returns (GriefEntry memory) {
        return entries[index];
    }
}
