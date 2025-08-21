// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckAuditOverlay {
    struct AuditLog {
        string country;
        string steward;
        string blessingType;
        uint256 aprScore;
        string qrLink;
        uint256 timestamp;
    }

    AuditLog[] public auditLogs;

    event AuditLogged(string country, string steward, string blessingType, uint256 aprScore);

    function logAudit(
        string memory _country,
        string memory _steward,
        string memory _blessingType,
        uint256 _aprScore,
        string memory _qrLink
    ) public {
        auditLogs.push(AuditLog({
            country: _country,
            steward: _steward,
            blessingType: _blessingType,
            aprScore: _aprScore,
            qrLink: _qrLink,
            timestamp: block.timestamp
        }));

        emit AuditLogged(_country, _steward, _blessingType, _aprScore);
    }

    function getAuditTrail() public view returns (AuditLog[] memory) {
        return auditLogs;
    }
}
