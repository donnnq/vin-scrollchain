// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WaterwayContainmentAuditDAO {
    address public steward;

    struct WaterwayEntry {
        string barangay;
        string waterwayType;
        string timestamp;
        string obstructionStatus;
        string siltationLevel;
        string emotionalTag;
    }

    WaterwayEntry[] public registry;

    event WaterwayAudited(string barangay, string waterwayType, string timestamp, string obstructionStatus, string siltationLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditWaterway(
        string memory barangay,
        string memory waterwayType,
        string memory timestamp,
        string memory obstructionStatus,
        string memory siltationLevel,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(WaterwayEntry(barangay, waterwayType, timestamp, obstructionStatus, siltationLevel, emotionalTag));
        emit WaterwayAudited(barangay, waterwayType, timestamp, obstructionStatus, siltationLevel, emotionalTag);
    }
}
