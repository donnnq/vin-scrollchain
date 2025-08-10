// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title LegacyAudit - Decodes historical distortion and civic manipulation
/// @author Vinvin
/// @notice Tracks legacy manipulation across media, education, and governance

contract LegacyAudit {
    struct AuditEntry {
        string figure;
        string distortionType;
        string medium;
        string encodedTruth;
        uint256 timestamp;
    }

    AuditEntry[] public audits;

    event LegacyDecoded(string figure, string distortionType, string medium, string encodedTruth, uint256 timestamp);

    function decodeLegacy(
        string calldata figure,
        string calldata distortionType,
        string calldata medium,
        string calldata encodedTruth
    ) external {
        audits.push(AuditEntry(figure, distortionType, medium, encodedTruth, block.timestamp));
        emit LegacyDecoded(figure, distortionType, medium, encodedTruth, block.timestamp);
    }

    function getAllAudits() external view returns (AuditEntry[] memory) {
        return audits;
    }
}
