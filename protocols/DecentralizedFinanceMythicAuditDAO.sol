// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedFinanceMythicAuditDAO {
    address public steward;

    struct AuditEntry {
        string protocolName;
        string timestamp;
        string auditDimension;
        string mythicInsight;
        string emotionalTag;
    }

    AuditEntry[] public registry;

    event MythicAuditLogged(string protocolName, string timestamp, string auditDimension, string mythicInsight, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logAudit(
        string memory protocolName,
        string memory timestamp,
        string memory auditDimension,
        string memory mythicInsight,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AuditEntry(protocolName, timestamp, auditDimension, mythicInsight, emotionalTag));
        emit MythicAuditLogged(protocolName, timestamp, auditDimension, mythicInsight, emotionalTag);
    }
}
