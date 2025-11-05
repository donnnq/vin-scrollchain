// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SolarInfrastructureEquityLedger {
    address public steward;

    struct SolarEntry {
        string location;
        string solarFeature;
        string equityProtocol;
        string emotionalTag;
    }

    SolarEntry[] public ledger;

    event SolarEquityTagged(string location, string solarFeature, string equityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSolarEquity(
        string memory location,
        string memory solarFeature,
        string memory equityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(SolarEntry(location, solarFeature, equityProtocol, emotionalTag));
        emit SolarEquityTagged(location, solarFeature, equityProtocol, emotionalTag);
    }
}
