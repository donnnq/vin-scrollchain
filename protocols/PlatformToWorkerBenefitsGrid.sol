// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlatformToWorkerBenefitsGrid {
    address public steward;

    struct BenefitsEntry {
        string platform; // "Shopee, Lazada"
        string benefitType; // "Paid holidays, sick leave, health insurance"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    BenefitsEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateBenefit(string memory platform, string memory benefitType, string memory emotionalTag) external onlySteward {
        entries.push(BenefitsEntry(platform, benefitType, emotionalTag, true, false));
    }

    function sealBenefitsEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getBenefitsEntry(uint256 index) external view returns (BenefitsEntry memory) {
        return entries[index];
    }
}
