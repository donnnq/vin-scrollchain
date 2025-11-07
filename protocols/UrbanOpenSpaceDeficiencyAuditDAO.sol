// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanOpenSpaceDeficiencyAuditDAO {
    address public steward;

    struct OpenSpaceEntry {
        string barangay;
        string timestamp;
        uint256 greenCoverPercent;
        string bufferZoneStatus;
        string creekAccessStatus;
        string emotionalTag;
    }

    OpenSpaceEntry[] public registry;

    event OpenSpaceAudited(string barangay, string timestamp, uint256 greenCoverPercent, string bufferZoneStatus, string creekAccessStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditOpenSpace(
        string memory barangay,
        string memory timestamp,
        uint256 greenCoverPercent,
        string memory bufferZoneStatus,
        string memory creekAccessStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(OpenSpaceEntry(barangay, timestamp, greenCoverPercent, bufferZoneStatus, creekAccessStatus, emotionalTag));
        emit OpenSpaceAudited(barangay, timestamp, greenCoverPercent, bufferZoneStatus, creekAccessStatus, emotionalTag);
    }
}
