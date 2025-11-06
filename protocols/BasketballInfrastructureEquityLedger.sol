// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasketballInfrastructureEquityLedger {
    address public steward;

    struct EquityEntry {
        string region;
        string facilityType;
        string accessLevel;
        string emotionalTag;
    }

    EquityEntry[] public ledger;

    event InfrastructureEquityTagged(string region, string facilityType, string accessLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEquity(
        string memory region,
        string memory facilityType,
        string memory accessLevel,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(EquityEntry(region, facilityType, accessLevel, emotionalTag));
        emit InfrastructureEquityTagged(region, facilityType, accessLevel, emotionalTag);
    }
}
