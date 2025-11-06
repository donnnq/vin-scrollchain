// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SlopeIntegrityAuditProtocol {
    address public steward;

    struct AuditEntry {
        string slopeLocation;
        string structuralRisk;
        string auditProtocol;
        string emotionalTag;
    }

    AuditEntry[] public registry;

    event SlopeIntegrityAudited(string slopeLocation, string structuralRisk, string auditProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditSlope(
        string memory slopeLocation,
        string memory structuralRisk,
        string memory auditProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AuditEntry(slopeLocation, structuralRisk, auditProtocol, emotionalTag));
        emit SlopeIntegrityAudited(slopeLocation, structuralRisk, auditProtocol, emotionalTag);
    }
}
