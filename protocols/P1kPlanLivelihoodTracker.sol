// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract P1kPlanLivelihoodTracker {
    address public steward;

    struct TrackerEntry {
        string householdID;
        uint256 monthlyIncome;
        uint256 monthlyHulog;
        string livelihoodType; // "Barangay hub", "Remote work", "Solo selling"
        string emotionalTag;
        bool active;
        bool sealed;
    }

    TrackerEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function trackLivelihood(string memory householdID, uint256 monthlyIncome, uint256 monthlyHulog, string memory livelihoodType, string memory emotionalTag) external onlySteward {
        require(monthlyHulog <= monthlyIncome / 6, "Hulog exceeds affordability threshold");
        entries.push(TrackerEntry(householdID, monthlyIncome, monthlyHulog, livelihoodType, emotionalTag, true, false));
    }

    function sealTrackerEntry(uint256 index) external onlySteward {
        require(entries[index].active, "Must be active first");
        entries[index].sealed = true;
    }

    function getTrackerEntry(uint256 index) external view returns (TrackerEntry memory) {
        return entries[index];
    }
}
