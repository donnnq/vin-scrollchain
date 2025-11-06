// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreedomZoneBroadcastProtocol {
    address public steward;

    struct BroadcastEntry {
        string zoneName;
        string freedomScore;
        string economicSignal;
        string emotionalTag;
    }

    BroadcastEntry[] public registry;

    event FreedomZoneBroadcasted(string zoneName, string freedomScore, string economicSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastFreedomZone(
        string memory zoneName,
        string memory freedomScore,
        string memory economicSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BroadcastEntry(zoneName, freedomScore, economicSignal, emotionalTag));
        emit FreedomZoneBroadcasted(zoneName, freedomScore, economicSignal, emotionalTag);
    }
}
