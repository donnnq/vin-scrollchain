// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WaterBillToLifelineReliefProtocol {
    address public steward;

    struct WaterReliefEntry {
        string householdID;
        uint monthlyConsumption; // e.g. 9 cu.m.
        string discountRate; // "49.3%"
        string provider; // "Maynilad", "Manila Water"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    WaterReliefEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployWaterRelief(string memory householdID, uint monthlyConsumption, string memory discountRate, string memory provider, string memory emotionalTag) external onlySteward {
        entries.push(WaterReliefEntry(householdID, monthlyConsumption, discountRate, provider, emotionalTag, true, false));
    }

    function sealWaterReliefEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getWaterReliefEntry(uint256 index) external view returns (WaterReliefEntry memory) {
        return entries[index];
    }
}
