// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliticalMobilizationBroadcastLedger {
    address public steward;

    struct BroadcastEntry {
        string timestamp;
        string campaignTitle;
        string urgencyLevel;
        string loyaltyFraming;
        string civicConsequence;
        string emotionalTag;
    }

    BroadcastEntry[] public ledger;

    event MobilizationBroadcasted(string timestamp, string campaignTitle, string urgencyLevel, string loyaltyFraming, string civicConsequence, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastMobilization(
        string memory timestamp,
        string memory campaignTitle,
        string memory urgencyLevel,
        string memory loyaltyFraming,
        string memory civicConsequence,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(BroadcastEntry(timestamp, campaignTitle, urgencyLevel, loyaltyFraming, civicConsequence, emotionalTag));
        emit MobilizationBroadcasted(timestamp, campaignTitle, urgencyLevel, loyaltyFraming, civicConsequence, emotionalTag);
    }
}
