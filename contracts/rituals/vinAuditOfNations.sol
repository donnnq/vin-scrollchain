// SPDX-License-Identifier: VINVIN-AntiCorruptStream-v001
pragma solidity ^0.8.24;

/// @title vinAuditOfNations
/// @notice Logs audit scores, governance integrity, and scrollkeeper-grade flags per nation
contract vinAuditOfNations {
    address public scrollkeeper;

    struct NationAudit {
        string nationName;
        uint8 transparencyScore; // 0–100
        bool corruptionFlag;
        string auditNotes;
        uint256 timestamp;
    }

    mapping(string => NationAudit) public auditLog;
    string[] public nationsAudited;

    event NationScanned(string indexed name, uint8 score, bool flag);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logAudit(
        string calldata name,
        uint8 score,
        bool flag,
        string calldata notes
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may forge audit of nations");
        auditLog[name] = NationAudit(name, score, flag, notes, block.timestamp);
        nationsAudited.push(name);
        emit NationScanned(name, score, flag);
    }

    function viewAudit(string calldata name) external view returns (
        uint8 score,
        bool flag,
        string memory notes,
        uint256 timeStamp
    ) {
        NationAudit memory result = auditLog[name];
        return (result.transparencyScore, result.corruptionFlag, result.auditNotes, result.timestamp);
    }

    function allAuditedNations() external view returns (string[] memory) {
        return nationsAudited;
    }
}
