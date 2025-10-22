// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArsonKarmaAuditGrid {
    address public admin;

    struct AuditEntry {
        string location; // "DPWH Compound, Quezon City"
        string suspectedMotive; // "Evidence destruction", "Sabotage"
        string consequenceSignal; // "Public outrage", "Legal escalation"
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

    function logArsonAudit(string memory location, string memory suspectedMotive, string memory consequenceSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(location, suspectedMotive, consequenceSignal, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
