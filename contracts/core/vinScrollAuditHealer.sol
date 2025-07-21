// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinScrollAuditHealer.sol
/// @notice Diagnostic + audit enhancement tool for scroll-level smart contracts
/// @author VINVIN

contract vinScrollAuditHealer {
    event AuditReportLogged(
        address indexed contractAddress,
        string auditCategory,
        string detail,
        uint256 timestamp
    );

    struct AuditEntry {
        string category;
        string detail;
        uint256 loggedAt;
    }

    mapping(address => AuditEntry[]) public auditLog;

    // 🔍 Log an audit insight manually
    function logAuditInsight(address scroll, string calldata category, string calldata detail) external {
        auditLog[scroll].push(AuditEntry({
            category: category,
            detail: detail,
            loggedAt: block.timestamp
        }));
        emit AuditReportLogged(scroll, category, detail, block.timestamp);
    }

    // 📖 View helper: get number of audit entries for scroll
    function getAuditCount(address scroll) external view returns (uint256) {
        return auditLog[scroll].length;
    }

    // 📚 View helper: read latest audit insight
    function getLatestAuditEntry(address scroll) external view returns (string memory category, string memory detail, uint256 loggedAt) {
        uint256 len = auditLog[scroll].length;
        require(len > 0, "AuditHealer: no logs");
        AuditEntry memory entry = auditLog[scroll][len - 1];
        return (entry.category, entry.detail, entry.loggedAt);
    }
}
