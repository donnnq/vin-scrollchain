// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RevenueToServiceImpactLedger {
    address public steward;

    struct ImpactEntry {
        string revenueSource; // "VAT", "Digital tax", "Excise"
        string serviceFunded; // "Healthcare", "Education", "Infrastructure"
        string impactLevel; // "Critical", "Sustainable", "Supplemental"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ImpactEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexImpact(string memory revenueSource, string memory serviceFunded, string memory impactLevel, string memory emotionalTag) external onlySteward {
        entries.push(ImpactEntry(revenueSource, serviceFunded, impactLevel, emotionalTag, true, false));
    }

    function sealImpactEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getImpactEntry(uint256 index) external view returns (ImpactEntry memory) {
        return entries[index];
    }
}
