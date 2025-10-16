// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsumerCreditDeteriorationAuditPack {
    address public admin;

    struct AuditEntry {
        string regionLabel;
        string creditStressType;
        string emotionalTag;
        bool audited;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory regionLabel, string memory creditStressType, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(regionLabel, creditStressType, emotionalTag, false));
    }

    function markAudited(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function getEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
