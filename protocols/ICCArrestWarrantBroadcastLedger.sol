// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICCArrestWarrantBroadcastLedger {
    address public steward;

    struct WarrantEntry {
        string timestamp;
        string subjectName;
        string jurisdiction;
        string disclosureChannel;
        string politicalVolatilitySignal;
        string emotionalTag;
    }

    WarrantEntry[] public ledger;

    event ICCWarrantBroadcasted(string timestamp, string subjectName, string jurisdiction, string disclosureChannel, string politicalVolatilitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastWarrant(
        string memory timestamp,
        string memory subjectName,
        string memory jurisdiction,
        string memory disclosureChannel,
        string memory politicalVolatilitySignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(WarrantEntry(timestamp, subjectName, jurisdiction, disclosureChannel, politicalVolatilitySignal, emotionalTag));
        emit ICCWarrantBroadcasted(timestamp, subjectName, jurisdiction, disclosureChannel, politicalVolatilitySignal, emotionalTag);
    }
}
