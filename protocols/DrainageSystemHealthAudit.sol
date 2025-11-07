// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DrainageSystemHealthAudit {
    address public steward;

    struct DrainageEntry {
        string barangay;
        string timestamp;
        string systemType;
        string blockageStatus;
        string flowCapacity;
        string emotionalTag;
    }

    DrainageEntry[] public audits;

    event DrainageAudited(string barangay, string timestamp, string systemType, string blockageStatus, string flowCapacity, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditDrainage(
        string memory barangay,
        string memory timestamp,
        string memory systemType,
        string memory blockageStatus,
        string memory flowCapacity,
        string memory emotionalTag
    ) public onlySteward {
        audits.push(DrainageEntry(barangay, timestamp, systemType, blockageStatus, flowCapacity, emotionalTag));
        emit DrainageAudited(barangay, timestamp, systemType, blockageStatus, flowCapacity, emotionalTag);
    }
}
