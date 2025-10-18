// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MigrantCareAuditCodex {
    address public admin;

    struct CareEntry {
        string migrantName;
        string careType;
        string emotionalTag;
        bool summoned;
        bool delivered;
    }

    CareEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCare(string memory migrantName, string memory careType, string memory emotionalTag) external onlyAdmin {
        entries.push(CareEntry(migrantName, careType, emotionalTag, true, false));
    }

    function deliverCare(uint256 index) external onlyAdmin {
        entries[index].delivered = true;
    }

    function getCareEntry(uint256 index) external view returns (CareEntry memory) {
        return entries[index];
    }
}
