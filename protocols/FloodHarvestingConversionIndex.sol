// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodHarvestingConversionIndex {
    address public steward;

    struct HarvestEntry {
        string region;
        string floodSource;
        string conversionMethod;
        string emotionalTag;
    }

    HarvestEntry[] public index;

    event FloodHarvestTagged(string region, string floodSource, string conversionMethod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagHarvest(
        string memory region,
        string memory floodSource,
        string memory conversionMethod,
        string memory emotionalTag
    ) public onlySteward {
        index.push(HarvestEntry(region, floodSource, conversionMethod, emotionalTag));
        emit FloodHarvestTagged(region, floodSource, conversionMethod, emotionalTag);
    }
}
