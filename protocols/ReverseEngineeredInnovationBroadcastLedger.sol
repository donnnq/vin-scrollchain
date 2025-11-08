// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReverseEngineeredInnovationBroadcastLedger {
    address public steward;

    struct InnovationEntry {
        string timestamp;
        string originEntity;
        string sourceCountry;
        string techDomain;
        string mimicryOutcome;
        string emotionalTag;
    }

    InnovationEntry[] public ledger;

    event InnovationBroadcasted(string timestamp, string originEntity, string sourceCountry, string techDomain, string mimicryOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastInnovation(
        string memory timestamp,
        string memory originEntity,
        string memory sourceCountry,
        string memory techDomain,
        string memory mimicryOutcome,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(InnovationEntry(timestamp, originEntity, sourceCountry, techDomain, mimicryOutcome, emotionalTag));
        emit InnovationBroadcasted(timestamp, originEntity, sourceCountry, techDomain, mimicryOutcome, emotionalTag);
    }
}
