// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetKarmaAuditProtocol {
    address public steward;

    struct AuditEntry {
        string department;
        string karmaSignal;
        string auditMechanism;
        string emotionalTag;
    }

    AuditEntry[] public protocol;

    event BudgetKarmaAudited(string department, string karmaSignal, string auditMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditKarma(
        string memory department,
        string memory karmaSignal,
        string memory auditMechanism,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(AuditEntry(department, karmaSignal, auditMechanism, emotionalTag));
        emit BudgetKarmaAudited(department, karmaSignal, auditMechanism, emotionalTag);
    }
}
