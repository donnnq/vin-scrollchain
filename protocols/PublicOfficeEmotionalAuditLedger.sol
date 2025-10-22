// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicOfficeEmotionalAuditLedger {
    address public admin;

    struct AuditEntry {
        string officialName;
        string exitContext;
        string emotionalSignal; // "Life goes on", "Exploring new things", "No regrets"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function auditEmotion(string memory officialName, string memory exitContext, string memory emotionalSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(officialName, exitContext, emotionalSignal, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
