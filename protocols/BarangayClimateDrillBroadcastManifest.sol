// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayClimateDrillBroadcastManifest {
    address public steward;

    struct DrillBroadcast {
        string barangay;
        string timestamp;
        string drillType;
        string participationLevel;
        string emotionalTag;
    }

    DrillBroadcast[] public manifest;

    event DrillBroadcasted(string barangay, string timestamp, string drillType, string participationLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastDrill(
        string memory barangay,
        string memory timestamp,
        string memory drillType,
        string memory participationLevel,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(DrillBroadcast(barangay, timestamp, drillType, participationLevel, emotionalTag));
        emit DrillBroadcasted(barangay, timestamp, drillType, participationLevel, emotionalTag);
    }
}
