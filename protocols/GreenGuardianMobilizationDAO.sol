// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GreenGuardianMobilizationDAO {
    address public steward;

    struct MobilizationEntry {
        string guardianName;
        string region;
        string timestamp;
        string actionType;
        string emotionalTag;
    }

    MobilizationEntry[] public registry;

    event GuardianMobilized(string guardianName, string region, string timestamp, string actionType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function mobilizeGuardian(
        string memory guardianName,
        string memory region,
        string memory timestamp,
        string memory actionType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(MobilizationEntry(guardianName, region, timestamp, actionType, emotionalTag));
        emit GuardianMobilized(guardianName, region, timestamp, actionType, emotionalTag);
    }
}
