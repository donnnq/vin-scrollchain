// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InspectorToPerformanceAuditProtocol {
    address public steward;

    struct AuditEntry {
        string inspectorRegion; // "Metro Manila, CAMANAVA"
        string failureType; // "Neglected inspections, unresolved complaints"
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

    function auditInspector(string memory inspectorRegion, string memory failureType, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(inspectorRegion, failureType, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
