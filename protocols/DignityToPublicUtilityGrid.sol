// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DignityToPublicUtilityGrid {
    address public steward;

    struct UtilityEntry {
        string serviceType; // "Water", "Electricity", "Internet", "Transport"
        string pricingModel; // "Zero-fee", "Tiered subsidy", "Community-backed"
        string dignitySignal; // "Abot-kaya", "Transparent", "Scrollchain-indexed"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    UtilityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployUtility(string memory serviceType, string memory pricingModel, string memory dignitySignal, string memory emotionalTag) external onlySteward {
        entries.push(UtilityEntry(serviceType, pricingModel, dignitySignal, emotionalTag, true, false));
    }

    function sealUtilityEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getUtilityEntry(uint256 index) external view returns (UtilityEntry memory) {
        return entries[index];
    }
}
