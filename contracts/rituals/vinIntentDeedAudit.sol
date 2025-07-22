// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinIntentDeedAudit
/// @notice Audits alignment between spoken intent and actual executed deed. Tracks consistency and scrollkeeper honor.
contract vinIntentDeedAudit {
    address public immutable scrollkeeper;

    struct AuditEntry {
        string intent;
        string deed;
        bool aligned;
        uint256 timestamp;
    }

    mapping(address => AuditEntry[]) public auditLogs;

    event AuditLogged(
        address indexed speaker,
        string intent,
        string deed,
        bool aligned,
        uint256 timestamp
    );

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not the scrollkeeper");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    /// @notice Record an intent-deed pair and evaluate alignment (manual judgment)
    function logAudit(address speaker, string calldata intent, string calldata deed, bool aligned) external onlyScrollkeeper {
        auditLogs[speaker].push(AuditEntry({
            intent: intent,
            deed: deed,
            aligned: aligned,
            timestamp: block.timestamp
        }));

        emit AuditLogged(speaker, intent, deed, aligned, block.timestamp);
    }

    /// @notice View all audit entries for a speaker
    function getAuditHistory(address speaker) external view returns (AuditEntry[] memory) {
        return auditLogs[speaker];
    }
}
