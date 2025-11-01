// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateAuditGridDAO {
    address public steward;

    struct Audit {
        string region;
        string anomalyType;
        string auditTag;
        string emotionalTag;
        uint256 timestamp;
    }

    Audit[] public auditLog;

    event ClimateAuditLogged(string region, string anomalyType, string auditTag, string emotionalTag, uint256 timestamp);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logAudit(
        string memory region,
        string memory anomalyType,
        string memory auditTag,
        string memory emotionalTag
    ) public onlySteward {
        auditLog.push(Audit(region, anomalyType, auditTag, emotionalTag, block.timestamp));
        emit ClimateAuditLogged(region, anomalyType, auditTag, emotionalTag, block.timestamp);
    }
}
