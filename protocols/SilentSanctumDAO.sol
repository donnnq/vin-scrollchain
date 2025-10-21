// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SilentSanctumDAO {
    address public admin;

    struct SanctumEntry {
        string location;
        string sanctumType; // "Quiet Zone", "Reflection Bench", "Peace Garden"
        string sanctumClause;
        string emotionalTag;
        bool summoned;
        bool designated;
        bool sealed;
    }

    SanctumEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSanctum(string memory location, string memory sanctumType, string memory sanctumClause, string memory emotionalTag) external onlyAdmin {
        entries.push(SanctumEntry(location, sanctumType, sanctumClause, emotionalTag, true, false, false));
    }

    function confirmDesignation(uint256 index) external onlyAdmin {
        entries[index].designated = true;
    }

    function sealSanctumEntry(uint256 index) external onlyAdmin {
        require(entries[index].designated, "Must be designated first");
        entries[index].sealed = true;
    }

    function getSanctumEntry(uint256 index) external view returns (SanctumEntry memory) {
        return entries[index];
    }
}
