// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateInfrastructureCorruptionAuditDAO {
    address public steward;

    struct AuditEntry {
        string projectName;
        string timestamp;
        string anomalyType;
        string agencyInvolved;
        string emotionalTag;
    }

    AuditEntry[] public registry;

    event CorruptionAudited(string projectName, string timestamp, string anomalyType, string agencyInvolved, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditCorruption(
        string memory projectName,
        string memory timestamp,
        string memory anomalyType,
        string memory agencyInvolved,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AuditEntry(projectName, timestamp, anomalyType, agencyInvolved, emotionalTag));
        emit CorruptionAudited(projectName, timestamp, anomalyType, agencyInvolved, emotionalTag);
    }
}
