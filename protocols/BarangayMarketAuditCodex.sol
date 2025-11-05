// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayMarketAuditCodex {
    address public steward;

    struct AuditClause {
        string barangay;
        string marketName;
        string auditProtocol;
        string emotionalTag;
    }

    AuditClause[] public codex;

    event MarketAuditTagged(string barangay, string marketName, string auditProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAudit(
        string memory barangay,
        string memory marketName,
        string memory auditProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(AuditClause(barangay, marketName, auditProtocol, emotionalTag));
        emit MarketAuditTagged(barangay, marketName, auditProtocol, emotionalTag);
    }
}
