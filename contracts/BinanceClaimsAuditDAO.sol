// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BinanceClaimsAuditDAO {
    address public steward;

    struct ClaimAudit {
        string userUID;
        string assetType; // "USDe", "BNSOL", "WBETH"
        string liquidationTimestamp;
        string claimStatus; // "Pending", "Approved", "Rejected"
        string auditNote;
        string emotionalTag;
        uint256 timestamp;
    }

    ClaimAudit[] public audits;

    event ClaimLogged(
        string userUID,
        string assetType,
        string liquidationTimestamp,
        string claimStatus,
        string auditNote,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log Binance claim audits");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logClaim(
        string memory userUID,
        string memory assetType,
        string memory liquidationTimestamp,
        string memory claimStatus,
        string memory auditNote,
        string memory emotionalTag
    ) external onlySteward {
        audits.push(ClaimAudit({
            userUID: userUID,
            assetType: assetType,
            liquidationTimestamp: liquidationTimestamp,
            claimStatus: claimStatus,
            auditNote: auditNote,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ClaimLogged(userUID, assetType, liquidationTimestamp, claimStatus, auditNote, emotionalTag, block.timestamp);
    }

    function getClaimByIndex(uint256 index) external view returns (
        string memory userUID,
        string memory assetType,
        string memory liquidationTimestamp,
        string memory claimStatus,
        string memory auditNote,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < audits.length, "Scrollstorm index out of bounds");
        ClaimAudit memory c = audits[index];
        return (
            c.userUID,
            c.assetType,
            c.liquidationTimestamp,
            c.claimStatus,
            c.auditNote,
            c.emotionalTag,
            c.timestamp
        );
    }
}
