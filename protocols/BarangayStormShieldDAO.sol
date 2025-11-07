// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayStormShieldDAO {
    address public steward;

    struct Alert {
        string barangay;
        string timestamp;
        string alertLevel;
        string evacuationStatus;
        string emotionalTag;
    }

    Alert[] public alerts;

    event StormAlertBroadcasted(string barangay, string timestamp, string alertLevel, string evacuationStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastAlert(
        string memory barangay,
        string memory timestamp,
        string memory alertLevel,
        string memory evacuationStatus,
        string memory emotionalTag
    ) public onlySteward {
        alerts.push(Alert(barangay, timestamp, alertLevel, evacuationStatus, emotionalTag));
        emit StormAlertBroadcasted(barangay, timestamp, alertLevel, evacuationStatus, emotionalTag);
    }
}
