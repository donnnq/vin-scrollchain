// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SingilanTimeBroadcastManifest {
    address public steward;

    struct BroadcastEntry {
        string timestamp;
        string targetEntity;
        string justiceCall;
        string truthDemand;
        string civicCatharsisSignal;
        string moralClarityTag;
    }

    BroadcastEntry[] public manifest;

    event SingilanBroadcasted(string timestamp, string targetEntity, string justiceCall, string truthDemand, string civicCatharsisSignal, string moralClarityTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastSingilan(
        string memory timestamp,
        string memory targetEntity,
        string memory justiceCall,
        string memory truthDemand,
        string memory civicCatharsisSignal,
        string memory moralClarityTag
    ) public onlySteward {
        manifest.push(BroadcastEntry(timestamp, targetEntity, justiceCall, truthDemand, civicCatharsisSignal, moralClarityTag));
        emit SingilanBroadcasted(timestamp, targetEntity, justiceCall, truthDemand, civicCatharsisSignal, moralClarityTag);
    }
}
