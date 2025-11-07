// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GreenWaterwayUrbanDesignManifest {
    address public steward;

    struct WaterwayDesign {
        string barangay;
        string timestamp;
        string retrofitType;
        string integrationStatus;
        string emotionalTag;
    }

    WaterwayDesign[] public manifest;

    event WaterwayDesignBroadcasted(string barangay, string timestamp, string retrofitType, string integrationStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastDesign(
        string memory barangay,
        string memory timestamp,
        string memory retrofitType,
        string memory integrationStatus,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(WaterwayDesign(barangay, timestamp, retrofitType, integrationStatus, emotionalTag));
        emit WaterwayDesignBroadcasted(barangay, timestamp, retrofitType, integrationStatus, emotionalTag);
    }
}
