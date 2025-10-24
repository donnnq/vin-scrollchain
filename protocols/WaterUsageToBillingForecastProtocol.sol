// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WaterUsageToBillingForecastProtocol {
    address public steward;

    struct ForecastEntry {
        string householdID;
        uint monthlyUsage; // e.g. 8 cu.m.
        string projectedBill; // "₱120"
        string discountApplied; // "Lifeline 49.3%"
        string emotionalTag;
        bool forecasted;
        bool sealed;
    }

    ForecastEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function forecastBilling(string memory householdID, uint monthlyUsage, string memory projectedBill, string memory discountApplied, string memory emotionalTag) external onlySteward {
        entries.push(ForecastEntry(householdID, monthlyUsage, projectedBill, discountApplied, emotionalTag, true, false));
    }

    function sealForecastEntry(uint256 index) external onlySteward {
        require(entries[index].forecasted, "Must be forecasted first");
        entries[index].sealed = true;
    }

    function getForecastEntry(uint256 index) external view returns (ForecastEntry memory) {
        return entries[index];
    }
}
