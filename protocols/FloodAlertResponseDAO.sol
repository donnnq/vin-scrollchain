// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodAlertResponseDAO {
    address public steward;

    struct AlertEntry {
        string barangay;
        string floodLevel;
        string responseProtocol;
        string emotionalTag;
    }

    AlertEntry[] public registry;

    event FloodAlertResponseBroadcasted(string barangay, string floodLevel, string responseProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastResponse(
        string memory barangay,
        string memory floodLevel,
        string memory responseProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AlertEntry(barangay, floodLevel, responseProtocol, emotionalTag));
        emit FloodAlertResponseBroadcasted(barangay, floodLevel, responseProtocol, emotionalTag);
    }
}
