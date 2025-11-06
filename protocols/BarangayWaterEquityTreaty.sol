// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayWaterEquityTreaty {
    address public steward;

    struct EquityEntry {
        string barangay;
        string waterAccessLevel;
        string equityDemand;
        string emotionalTag;
    }

    EquityEntry[] public treaty;

    event WaterEquityTagged(string barangay, string waterAccessLevel, string equityDemand, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEquity(
        string memory barangay,
        string memory waterAccessLevel,
        string memory equityDemand,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(EquityEntry(barangay, waterAccessLevel, equityDemand, emotionalTag));
        emit WaterEquityTagged(barangay, waterAccessLevel, equityDemand, emotionalTag);
    }
}
