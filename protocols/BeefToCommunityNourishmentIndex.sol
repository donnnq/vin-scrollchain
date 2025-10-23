// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BeefToCommunityNourishmentIndex {
    address public steward;

    struct NourishmentEntry {
        string region;
        string beefSource; // "Local ranch", "Foreign import"
        string nourishmentImpact; // "Purok feeding", "School meals", "Market stability"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    NourishmentEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexNourishment(string memory region, string memory beefSource, string memory nourishmentImpact, string memory emotionalTag) external onlySteward {
        entries.push(NourishmentEntry(region, beefSource, nourishmentImpact, emotionalTag, true, false));
    }

    function sealNourishmentEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getNourishmentEntry(uint256 index) external view returns (NourishmentEntry memory) {
        return entries[index];
    }
}
