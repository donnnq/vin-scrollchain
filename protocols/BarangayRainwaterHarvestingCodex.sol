// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRainwaterHarvestingCodex {
    address public steward;

    struct HarvestEntry {
        string barangay;
        string harvestingMethod;
        string usageProtocol;
        string emotionalTag;
    }

    HarvestEntry[] public codex;

    event RainwaterHarvestTagged(string barangay, string harvestingMethod, string usageProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagHarvest(
        string memory barangay,
        string memory harvestingMethod,
        string memory usageProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(HarvestEntry(barangay, harvestingMethod, usageProtocol, emotionalTag));
        emit RainwaterHarvestTagged(barangay, harvestingMethod, usageProtocol, emotionalTag);
    }
}
