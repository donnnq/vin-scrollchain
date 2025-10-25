// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureToAuditActivationGrid {
    address public steward;

    struct AuditEntry {
        string infrastructureType; // "Water dam", "Drainage system", "Evacuation route"
        string region; // "Xi’an", "Chongqing", "Guizhou"
        string auditTrigger; // "Neglect", "Collapse", "Unfunded upgrade"
        string emotionalTag;
        bool activated;
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

    function activateAudit(string memory infrastructureType, string memory region, string memory auditTrigger, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(infrastructureType, region, auditTrigger, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
