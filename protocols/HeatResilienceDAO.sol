// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeatResilienceDAO {
    address public steward;

    struct ResilienceEntry {
        string zone;
        string resilienceProtocol;
        string civicSignal;
        string emotionalTag;
    }

    ResilienceEntry[] public registry;

    event HeatResilienceBroadcasted(string zone, string resilienceProtocol, string civicSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastResilience(
        string memory zone,
        string memory resilienceProtocol,
        string memory civicSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ResilienceEntry(zone, resilienceProtocol, civicSignal, emotionalTag));
        emit HeatResilienceBroadcasted(zone, resilienceProtocol, civicSignal, emotionalTag);
    }
}
