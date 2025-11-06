// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StationNeglectAccountabilityLedger {
    address public steward;

    struct NeglectEntry {
        string stationName;
        string neglectType;
        string civicImpact;
        string emotionalTag;
    }

    NeglectEntry[] public ledger;

    event StationNeglectTagged(string stationName, string neglectType, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagNeglect(
        string memory stationName,
        string memory neglectType,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(NeglectEntry(stationName, neglectType, civicImpact, emotionalTag));
        emit StationNeglectTagged(stationName, neglectType, civicImpact, emotionalTag);
    }
}
