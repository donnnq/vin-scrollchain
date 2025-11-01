// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrabPingDAO {
    address public steward;

    struct Ping {
        string crabID;
        string location;
        string detectedEntity;
        string signalStrength;
        string emotionalTag;
    }

    Ping[] public pingLog;

    event PingBroadcasted(string crabID, string location, string detectedEntity, string signalStrength, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastPing(
        string memory crabID,
        string memory location,
        string memory detectedEntity,
        string memory signalStrength,
        string memory emotionalTag
    ) public onlySteward {
        pingLog.push(Ping(crabID, location, detectedEntity, signalStrength, emotionalTag));
        emit PingBroadcasted(crabID, location, detectedEntity, signalStrength, emotionalTag);
    }
}
