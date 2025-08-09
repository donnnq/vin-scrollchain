// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SoulAudit - Ritual scroll for quarterly audits of soul metrics across barangays and public structures
/// @author Vinvin
/// @notice Aggregates joy, dignity, and impact scores for governance and style upgrades

contract SoulAudit {
    address public scrollsmith;

    struct AuditReport {
        uint256 joyTotal;
        uint256 dignityTotal;
        uint256 impactTotal;
        uint256 structureCount;
        string summary;
        uint256 timestamp;
    }

    mapping(string => AuditReport[]) public barangayAudits;

    event AuditSubmitted(string indexed barangay, uint256 joy, uint256 dignity, uint256 impact, string summary);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Submit a quarterly soul audit for a barangay
    function submitAudit(
        string memory barangay,
        uint256 joyTotal,
        uint256 dignityTotal,
        uint256 impactTotal,
        uint256 structureCount,
        string memory summary
    ) external onlyScrollsmith {
        barangayAudits[barangay].push(AuditReport({
            joyTotal: joyTotal,
            dignityTotal: dignityTotal,
            impactTotal: impactTotal,
            structureCount: structureCount,
            summary: summary,
            timestamp: block.timestamp
        }));

        emit AuditSubmitted(barangay, joyTotal, dignityTotal, impactTotal, summary);
    }

    /// @notice View latest audit report for a barangay
    function getLatestAudit(string memory barangay) external view returns (AuditReport memory) {
        uint256 len = barangayAudits[barangay].length;
        require(len > 0, "No audits yet");
        return barangayAudits[barangay][len - 1];
    }

    /// @notice View all audit history for a barangay
    function getAuditHistory(string memory barangay) external view returns (AuditReport[] memory) {
        return barangayAudits[barangay];
    }
}
