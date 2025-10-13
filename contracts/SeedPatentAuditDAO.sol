// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SeedPatentAuditDAO {
    address public steward;

    struct SeedAudit {
        string seedName;
        string patentHolder;
        string auditType; // "Monopoly", "Expired", "Open Source"
        string emotionalTag;
        uint256 timestamp;
    }

    SeedAudit[] public audits;

    event SeedLogged(
        string seedName,
        string patentHolder,
        string auditType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log seed patent rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSeed(
        string memory seedName,
        string memory patentHolder,
        string memory auditType,
        string memory emotionalTag
    ) external onlySteward {
        audits.push(SeedAudit({
            seedName: seedName,
            patentHolder: patentHolder,
            auditType: auditType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SeedLogged(seedName, patentHolder, auditType, emotionalTag, block.timestamp);
    }

    function getSeedByIndex(uint256 index) external view returns (
        string memory seedName,
        string memory patentHolder,
        string memory auditType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < audits.length, "Scrollstorm index out of bounds");
        SeedAudit memory s = audits[index];
        return (
            s.seedName,
            s.patentHolder,
            s.auditType,
            s.emotionalTag,
            s.timestamp
        );
    }
}
