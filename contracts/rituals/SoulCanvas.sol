// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

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

contract SoulCanvas {
    IMythicAudit public audit;

    constructor(address auditAddress) {
        audit = IMythicAudit(auditAddress);
    }

    /// @notice Get visual data for frontend rendering
    function getCanvasData(string memory barangay) external view returns (
        string memory title,
        string memory subtitle,
        uint256 soulScore,
        string memory recommendation
    ) {
        IMythicAudit.AuditReport memory report = audit.viewReport(barangay);

        string memory title = string(abi.encodePacked("SoulCanvas: ", barangay));
        string memory subtitle = string(abi.encodePacked(
            "Joy: ", uint2str(report.totalJoy),
            ", Dignity: ", uint2str(report.totalDignity),
            ", Impact: ", uint2str(report.totalImpact)
        ));

        return (title, subtitle, report.soulScore, report.recommendation);
    }

    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) return "0";
        uint256 j = _i;
        uint256 len;
        while (j != 0) { len++; j /= 10; }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        while (_i != 0) {
            k = k - 1;
            bstr[k] = bytes1(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
}
