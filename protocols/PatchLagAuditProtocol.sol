// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatchLagAuditProtocol {
    address public admin;

    struct AuditEntry {
        string systemAsset; // "Windows Server 2019", "Workstation-Alpha"
        string patchCode; // "KB5027215"
        string lagSignal; // "Unpatched for 90 days", "Missed June 2025 rollout"
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

    function auditPatchLag(string memory systemAsset, string memory patchCode, string memory lagSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(systemAsset, patchCode, lagSignal, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
