// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureKarmaAuditProtocol {
    address public steward;

    struct AuditEntry {
        string projectReference;
        string karmaSignal;
        string auditMechanism;
        string emotionalTag;
    }

    AuditEntry[] public protocol;

    event InfrastructureKarmaAudited(string projectReference, string karmaSignal, string auditMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditKarma(
        string memory projectReference,
        string memory karmaSignal,
        string memory auditMechanism,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(AuditEntry(projectReference, karmaSignal, auditMechanism, emotionalTag));
        emit InfrastructureKarmaAudited(projectReference, karmaSignal, auditMechanism, emotionalTag);
    }
}
