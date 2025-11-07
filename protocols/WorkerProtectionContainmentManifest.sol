// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerProtectionContainmentManifest {
    address public steward;

    struct ProtectionEntry {
        string timestamp;
        string sector;
        string protectionType;
        string enforcementMechanism;
        string emotionalTag;
    }

    ProtectionEntry[] public manifest;

    event WorkerProtectionContained(string timestamp, string sector, string protectionType, string enforcementMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containProtection(
        string memory timestamp,
        string memory sector,
        string memory protectionType,
        string memory enforcementMechanism,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(ProtectionEntry(timestamp, sector, protectionType, enforcementMechanism, emotionalTag));
        emit WorkerProtectionContained(timestamp, sector, protectionType, enforcementMechanism, emotionalTag);
    }
}
