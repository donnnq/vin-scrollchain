// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForeignMilitaryThreatBroadcastLedger {
    address public steward;

    struct ThreatEntry {
        string timestamp;
        string targetCountry;
        string threatType;
        string justification;
        string religiousFraming;
        string geopoliticalIgnitionTag;
    }

    ThreatEntry[] public ledger;

    event MilitaryThreatBroadcasted(string timestamp, string targetCountry, string threatType, string justification, string religiousFraming, string geopoliticalIgnitionTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastThreat(
        string memory timestamp,
        string memory targetCountry,
        string memory threatType,
        string memory justification,
        string memory religiousFraming,
        string memory geopoliticalIgnitionTag
    ) public onlySteward {
        ledger.push(ThreatEntry(timestamp, targetCountry, threatType, justification, religiousFraming, geopoliticalIgnitionTag));
        emit MilitaryThreatBroadcasted(timestamp, targetCountry, threatType, justification, religiousFraming, geopoliticalIgnitionTag);
    }
}
