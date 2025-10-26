// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InsuranceToMandatoryCoverageTreaty {
    address public steward;

    struct CoverageEntry {
        string platform; // "Shopee, Lazada"
        string coverageType; // "Accident, health, emergency support"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    CoverageEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyCoverage(string memory platform, string memory coverageType, string memory emotionalTag) external onlySteward {
        entries.push(CoverageEntry(platform, coverageType, emotionalTag, true, false));
    }

    function sealCoverageEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getCoverageEntry(uint256 index) external view returns (CoverageEntry memory) {
        return entries[index];
    }
}
