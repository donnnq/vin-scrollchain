// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.0;

import "./BlessingDeckGlobal_AuditLog.sol";

/// @title BlessingDeckGlobalDashboard
/// @author Vinvin
/// @notice Visualizes audit log data: emotional APR, franchise heatmaps, and creator blessing summaries

contract BlessingDeckGlobalDashboard {
    BlessingDeckGlobal_AuditLog public auditLog;
    address public steward;

    constructor(address _auditLogAddress) {
        auditLog = BlessingDeckGlobal_AuditLog(_auditLogAddress);
        steward = msg.sender;
    }

    struct CreatorSummary {
        uint256 totalBlessings;
        uint256 averageAPR;
        string[] franchises;
    }

    function getCreatorSummary(address creator) public view returns (CreatorSummary memory) {
        BlessingDeckGlobal_AuditLog.AuditEntry[] memory entries = auditLog.getBlessingsByCreator(creator);
        uint256 total = 0;
        uint256 aprSum = 0;
        string[] memory allFranchises;

        for (uint256 i = 0; i < entries.length; i++) {
            total += entries[i].amount;
            aprSum += entries[i].emotionalAPR;
            allFranchises = entries[i].franchises; // overwrite for simplicity
        }

        uint256 avgAPR = entries.length > 0 ? aprSum / entries.length : 0;

        return CreatorSummary(total, avgAPR, allFranchises);
    }

    function getTopFranchiseBlessings(string memory franchise) public view returns (uint256 totalBlessed) {
        BlessingDeckGlobal_AuditLog.AuditEntry[] memory entries = auditLog.getAuditLog();
        uint256 total = 0;

        for (uint256 i = 0; i < entries.length; i++) {
            for (uint256 j = 0; j < entries[i].franchises.length; j++) {
                if (keccak256(bytes(entries[i].franchises[j])) == keccak256(bytes(franchise))) {
                    total += entries[i].amount;
                }
            }
        }

        return total;
    }

    function getGlobalAPR() public view returns (uint256 averageAPR) {
        BlessingDeckGlobal_AuditLog.AuditEntry[] memory entries = auditLog.getAuditLog();
        uint256 aprSum = 0;

        for (uint256 i = 0; i < entries.length; i++) {
            aprSum += entries[i].emotionalAPR;
        }

        return entries.length > 0 ? aprSum / entries.length : 0;
    }
}
