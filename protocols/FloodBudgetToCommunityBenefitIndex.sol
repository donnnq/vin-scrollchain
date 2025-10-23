// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodBudgetToCommunityBenefitIndex {
    address public steward;

    struct BenefitEntry {
        string region;
        uint256 ghostBudget;
        string reallocationTarget; // "Purok restoration", "Youth sanctum", "Infrastructure audit"
        string benefitType; // "Housing", "Mobility", "Sanitation"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    BenefitEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexBenefit(string memory region, uint256 ghostBudget, string memory reallocationTarget, string memory benefitType, string memory emotionalTag) external onlySteward {
        entries.push(BenefitEntry(region, ghostBudget, reallocationTarget, benefitType, emotionalTag, true, false));
    }

    function sealBenefitEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getBenefitEntry(uint256 index) external view returns (BenefitEntry memory) {
        return entries[index];
    }
}
