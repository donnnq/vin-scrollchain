// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HouseholdToReliefEligibilityGrid {
    address public steward;

    struct EligibilityEntry {
        string householdID;
        uint monthlyConsumption; // e.g. 198 kWh
        string reliefStatus; // "Eligible", "Pending", "Above threshold"
        string emotionalTag;
        bool verified;
        bool sealed;
    }

    EligibilityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function verifyEligibility(string memory householdID, uint monthlyConsumption, string memory reliefStatus, string memory emotionalTag) external onlySteward {
        entries.push(EligibilityEntry(householdID, monthlyConsumption, reliefStatus, emotionalTag, true, false));
    }

    function sealEligibilityEntry(uint256 index) external onlySteward {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getEligibilityEntry(uint256 index) external view returns (EligibilityEntry memory) {
        return entries[index];
    }
}
