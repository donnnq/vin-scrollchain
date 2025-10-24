// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodCreditToHouseholdNourishmentLedger {
    address public steward;

    struct FoodAidEntry {
        string householdID;
        string program; // "Walang Gutom Program", "REFUEL"
        uint monthlyCredit; // e.g. 3000
        string redemptionMode; // "e-voucher", "rice subsidy"
        string emotionalTag;
        bool credited;
        bool sealed;
    }

    FoodAidEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function creditFoodAid(string memory householdID, string memory program, uint monthlyCredit, string memory redemptionMode, string memory emotionalTag) external onlySteward {
        entries.push(FoodAidEntry(householdID, program, monthlyCredit, redemptionMode, emotionalTag, true, false));
    }

    function sealFoodAidEntry(uint256 index) external onlySteward {
        require(entries[index].credited, "Must be credited first");
        entries[index].sealed = true;
    }

    function getFoodAidEntry(uint256 index) external view returns (FoodAidEntry memory) {
        return entries[index];
    }
}
