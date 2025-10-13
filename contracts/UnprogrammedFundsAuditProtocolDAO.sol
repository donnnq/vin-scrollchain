// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract UnprogrammedFundsAuditProtocolDAO {
    address public steward;

    struct AuditEvent {
        string fundSource;
        uint256 amount;
        string projectType;
        string auditStatus;
        string emotionalTag;
        uint256 timestamp;
    }

    AuditEvent[] public events;

    event AuditLogged(
        string fundSource,
        uint256 amount,
        string projectType,
        string auditStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log unprogrammed fund audits");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAudit(
        string memory fundSource,
        uint256 amount,
        string memory projectType,
        string memory auditStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(AuditEvent({
            fundSource: fundSource,
            amount: amount,
            projectType: projectType,
            auditStatus: auditStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AuditLogged(fundSource, amount, projectType, auditStatus, emotionalTag, block.timestamp);
    }

    function getAuditByIndex(uint256 index) external view returns (
        string memory fundSource,
        uint256 amount,
        string memory projectType,
        string memory auditStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AuditEvent memory a = events[index];
        return (
            a.fundSource,
            a.amount,
            a.projectType,
            a.auditStatus,
            a.emotionalTag,
            a.timestamp
        );
    }
}
