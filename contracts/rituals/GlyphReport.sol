// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title GlyphReport - Visualizer for MythicAudit soul data and ritual impact metrics
/// @author Vinvin
/// @notice Converts audit reports into glyph-ready data for frontend rendering

interface IMythicAudit {
    struct AuditReport {
        string barangay;
        uint256 totalJoy;
        uint256 totalDignity;
        uint256 totalImpact;
        uint256 ritualsExecuted;
        uint256 soulScore;
        string recommendation;
    }

    function viewReport(string memory barangay) external view returns (AuditReport memory);
}

contract GlyphReport {
    address public scrollsmith;
    IMythicAudit public audit;

    event GlyphGenerated(string indexed barangay, uint256 soulScore, string glyphType);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor(address auditAddress) {
        scrollsmith = msg.sender;
        audit = IMythicAudit(auditAddress);
    }

    /// @notice Generate glyph metadata based on soul score
    function generateGlyph(string memory barangay) external onlyScrollsmith returns (string memory) {
        IMythicAudit.AuditReport memory report = audit.viewReport(barangay);
        string memory glyphType;

        if (report.soulScore >= 900) {
            glyphType = "Phoenix Glyph 🐦‍🔥";
        } else if (report.soulScore >= 600) {
            glyphType = "Lotus Glyph 🌸";
        } else if (report.soulScore >= 300) {
            glyphType = "Torch Glyph 🔥";
        } else {
            glyphType = "Echo Glyph 🪞";
        }

        emit GlyphGenerated(barangay, report.soulScore, glyphType);
        return glyphType;
    }

    /// @notice View raw glyph data for frontend rendering
    function getGlyphData(string memory barangay) external view returns (
        uint256 joy,
        uint256 dignity,
        uint256 impact,
        uint256 soulScore,
        string memory recommendation
    ) {
        IMythicAudit.AuditReport memory report = audit.viewReport(barangay);
        return (
            report.totalJoy,
            report.totalDignity,
            report.totalImpact,
            report.soulScore,
            report.recommendation
        );
    }
}
