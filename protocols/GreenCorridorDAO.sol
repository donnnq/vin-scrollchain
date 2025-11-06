// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GreenCorridorDAO {
    address public steward;

    struct CorridorEntry {
        string corridorName;
        string plantingProtocol;
        string civicSignal;
        string emotionalTag;
    }

    CorridorEntry[] public registry;

    event GreenCorridorBroadcasted(string corridorName, string plantingProtocol, string civicSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastCorridor(
        string memory corridorName,
        string memory plantingProtocol,
        string memory civicSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(CorridorEntry(corridorName, plantingProtocol, civicSignal, emotionalTag));
        emit GreenCorridorBroadcasted(corridorName, plantingProtocol, civicSignal, emotionalTag);
    }
}
