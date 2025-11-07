// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AncestralWatershedProtectionTreaty {
    address public steward;

    struct ProtectionEntry {
        string community;
        string watershedName;
        string timestamp;
        string protectionStatus;
        string emotionalTag;
    }

    ProtectionEntry[] public treaty;

    event WatershedProtected(string community, string watershedName, string timestamp, string protectionStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function protectWatershed(
        string memory community,
        string memory watershedName,
        string memory timestamp,
        string memory protectionStatus,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(ProtectionEntry(community, watershedName, timestamp, protectionStatus, emotionalTag));
        emit WatershedProtected(community, watershedName, timestamp, protectionStatus, emotionalTag);
    }
}
