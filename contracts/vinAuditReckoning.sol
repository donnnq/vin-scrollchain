// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinAuditReckoning {
    event LedgerDispute(address indexed protocol, string accusation, uint256 timestamp);
    event AuditReleased(address indexed auditor, string statementLink, uint256 timestamp);
    event RedemptionStream(address indexed founder, string resolutionMsg, uint256 timestamp);

    struct AuditEvent {
        string accusation;
        string statement;
        string resolutionMsg;
        bool streamCompleted;
    }

    mapping(address => AuditEvent[]) public reckoningLog;

    function reportDispute(address _protocol, string calldata _accusation) external {
        reckoningLog[_protocol].push(AuditEvent({
            accusation: _accusation,
            statement: "",
            resolutionMsg: "",
            streamCompleted: false
        }));
        emit LedgerDispute(_protocol, _accusation, block.timestamp);
    }

    function releaseAudit(address _protocol, string calldata _statementLink) external {
        uint256 index = reckoningLog[_protocol].length - 1;
        AuditEvent storage audit = reckoningLog[_protocol][index];
        require(!audit.streamCompleted, "Audit already completed.");
        audit.statement = _statementLink;
        emit AuditReleased(msg.sender, _statementLink, block.timestamp);
    }

    function completeRedemption(address _protocol, string calldata _resolutionMsg) external {
        uint256 index = reckoningLog[_protocol].length - 1;
        AuditEvent storage audit = reckoningLog[_protocol][index];
        require(bytes(audit.statement).length > 0, "Audit statement missing.");
        audit.resolutionMsg = _resolutionMsg;
        audit.streamCompleted = true;
        emit RedemptionStream(msg.sender, _resolutionMsg, block.timestamp);
    }

    function viewLatestReckoning(address _protocol) external view returns (AuditEvent memory) {
        uint256 index = reckoningLog[_protocol].length - 1;
        return reckoningLog[_protocol][index];
    }
}
