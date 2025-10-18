// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthSportsSanctumCodex {
    address public admin;

    struct SanctumEntry {
        string region;
        string sport;
        string emotionalTag;
        bool protected;
        bool audited;
    }

    SanctumEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function protectSanctum(string memory region, string memory sport, string memory emotionalTag) external onlyAdmin {
        entries.push(SanctumEntry(region, sport, emotionalTag, true, false));
    }

    function auditSanctum(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function getSanctumEntry(uint256 index) external view returns (SanctumEntry memory) {
        return entries[index];
    }
}
