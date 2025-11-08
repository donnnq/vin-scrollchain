// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanDignityRestorationBroadcastLedger {
    address public steward;

    struct BroadcastEntry {
        string timestamp;
        string location;
        string infrastructureType;
        string beautificationProposal;
        string visualHealingSignal;
        string commuterWellnessTag;
    }

    BroadcastEntry[] public ledger;

    event UrbanDignityBroadcasted(string timestamp, string location, string infrastructureType, string beautificationProposal, string visualHealingSignal, string commuterWellnessTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastDignity(
        string memory timestamp,
        string memory location,
        string memory infrastructureType,
        string memory beautificationProposal,
        string memory visualHealingSignal,
        string memory commuterWellnessTag
    ) public onlySteward {
        ledger.push(BroadcastEntry(timestamp, location, infrastructureType, beautificationProposal, visualHealingSignal, commuterWellnessTag));
        emit UrbanDignityBroadcasted(timestamp, location, infrastructureType, beautificationProposal, visualHealingSignal, commuterWellnessTag);
    }
}
