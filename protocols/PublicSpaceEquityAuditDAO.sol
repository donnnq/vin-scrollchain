// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicSpaceEquityAuditDAO {
    address public steward;

    struct AuditEntry {
        string timestamp;
        string barangayOrDistrict;
        string spaceType;
        string accessLevel;
        string equityGapSignal;
        string emotionalTag;
    }

    AuditEntry[] public registry;

    event PublicSpaceEquityAudited(string timestamp, string barangayOrDistrict, string spaceType, string accessLevel, string equityGapSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditEquity(
        string memory timestamp,
        string memory barangayOrDistrict,
        string memory spaceType,
        string memory accessLevel,
        string memory equityGapSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AuditEntry(timestamp, barangayOrDistrict, spaceType, accessLevel, equityGapSignal, emotionalTag));
        emit PublicSpaceEquityAudited(timestamp, barangayOrDistrict, spaceType, accessLevel, equityGapSignal, emotionalTag);
    }
}
