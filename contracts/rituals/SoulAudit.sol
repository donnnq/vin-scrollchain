// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SoulAudit - Ritual scroll for quarterly audits of soul metrics across barangays and public structures
/// @author Vinvin
/// @notice Aggregates joy, dignity, and impact scores for governance and style upgrades

contract SoulAudit {
    address public immutable scrollsmith;

    struct AuditReport {
        uint256 joyTotal;
        uint256 dignityTotal;
        uint256 impactTotal;
        uint256 structureCount;
        string summary;
        uint256 timestamp;
    }

    mapping(string => AuditReport[]) private barangayAudits;

    event AuditSubmitted(
        string indexed barangay,
        uint256 joyTotal,
        uint256 dignityTotal,
        uint256 impactTotal,
        string summary,
        uint256 timestamp
    );

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Unauthorized: not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Submit a quarterly soul audit for a barangay
    /// @param barangay Name of the barangay
    /// @param joyTotal Aggregated joy score
    /// @param dignityTotal Aggregated dignity score
    /// @param impactTotal Aggregated impact score
    /// @param structureCount Number of structures audited
    /// @param summary Narrative summary of the audit
    function submitAudit(
        string calldata barangay,
        uint256 joyTotal,
        uint256 dignityTotal,
        uint256 impactTotal,
        uint256 structureCount,
        string calldata summary
    ) external onlyScrollsmith {
        AuditReport memory report = AuditReport({
            joyTotal: joyTotal,
            dignityTotal: dignityTotal,
            impactTotal: impactTotal,
            structureCount: structureCount,
            summary: summary,
            timestamp: block.timestamp
        });

        barangayAudits[barangay].push(report);

        emit AuditSubmitted(barangay, joyTotal, dignityTotal, impactTotal, summary, block.timestamp);
    }

    /// @notice View latest audit report for a barangay
    /// @param barangay Name of the barangay
    /// @return Latest AuditReport struct
    function getLatestAudit(string calldata barangay) external view returns (AuditReport memory) {
        AuditReport[] storage reports = barangayAudits[barangay];
        require(reports.length > 0, "No audits found");
        return reports[reports.length - 1];
    }

    /// @notice View full audit history for a barangay
    /// @param barangay Name of the barangay
    /// @return Array of AuditReport structs
    function getAuditHistory(string calldata barangay) external view returns (AuditReport[] memory) {
        return barangayAudits[barangay];
    }
}
