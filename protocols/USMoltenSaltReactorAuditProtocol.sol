// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract USMoltenSaltReactorAuditProtocol {
    address public steward;

    struct AuditEntry {
        string facilityName;
        string reactorType;
        string auditStatus;
        string emotionalTag;
    }

    AuditEntry[] public protocol;

    event ReactorAuditTagged(string facilityName, string reactorType, string auditStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAudit(
        string memory facilityName,
        string memory reactorType,
        string memory auditStatus,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(AuditEntry(facilityName, reactorType, auditStatus, emotionalTag));
        emit ReactorAuditTagged(facilityName, reactorType, auditStatus, emotionalTag);
    }
}
