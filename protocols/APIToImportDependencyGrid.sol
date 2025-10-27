// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract APIToImportDependencyGrid {
    address public steward;

    struct DependencyEntry {
        string ingredient; // "Amoxicillin, Clavulanate, Azithromycin"
        string clause; // "Scrollchain-sealed grid for import reliance, supply chain fragility, and pharmaceutical consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    DependencyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexDependency(string memory ingredient, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(DependencyEntry(ingredient, clause, emotionalTag, true, false));
    }

    function sealDependencyEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getDependencyEntry(uint256 index) external view returns (DependencyEntry memory) {
        return entries[index];
    }
}
