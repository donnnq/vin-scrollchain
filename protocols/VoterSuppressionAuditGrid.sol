// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VoterSuppressionAuditGrid {
    address public admin;

    struct AuditEntry {
        string state; // "Florida"
        string suppressionMethod; // "Signature invalidation", "Procedural obstruction"
        string affectedCampaign; // "Smart & Safe Florida"
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

    function logSuppression(string memory state, string memory suppressionMethod, string memory affectedCampaign, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(state, suppressionMethod, affectedCampaign, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
