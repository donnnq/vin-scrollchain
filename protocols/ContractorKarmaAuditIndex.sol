// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorKarmaAuditIndex {
    address public admin;

    struct AuditEntry {
        string contractorName; // "XYZ Builders Inc."
        string anomalyType; // "Flood control overpricing", "Delayed bridge project"
        string karmaSignal; // "Blacklist recommendation", "Asset freeze", "Public exposure"
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

    function auditContractor(string memory contractorName, string memory anomalyType, string memory karmaSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(contractorName, anomalyType, karmaSignal, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
