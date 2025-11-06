// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DemocracyResilienceBroadcastDAO {
    address public steward;

    struct ResilienceEntry {
        string institution;
        string resilienceSignal;
        string broadcastProtocol;
        string emotionalTag;
    }

    ResilienceEntry[] public registry;

    event DemocracyResilienceBroadcasted(string institution, string resilienceSignal, string broadcastProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastResilience(
        string memory institution,
        string memory resilienceSignal,
        string memory broadcastProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ResilienceEntry(institution, resilienceSignal, broadcastProtocol, emotionalTag));
        emit DemocracyResilienceBroadcasted(institution, resilienceSignal, broadcastProtocol, emotionalTag);
    }
}
