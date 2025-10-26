// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PharmaToPlanetaryAuditGrid {
    address public steward;

    struct AuditEntry {
        string medicineName; // "QuantumPainX"
        string originCountry; // "Philippines"
        string auditScope; // "Global deployment, recipe integrity, ethical licensing"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    AuditEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logAudit(string memory medicineName, string memory originCountry, string memory auditScope, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(medicineName, originCountry, auditScope, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
