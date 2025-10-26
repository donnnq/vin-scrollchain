// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctumToDiasporaNourishmentGrid {
    address public steward;

    struct NourishmentEntry {
        string sanctumType; // "Heritage kitchen, migrant pantry, ancestral recipe vault"
        string nourishmentClause; // "Scrollchain-sealed grid for diaspora feeding, flavor sovereignty, and planetary consequence"
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

    function indexNourishment(string memory sanctumType, string memory nourishmentClause, string memory emotionalTag) external onlySteward {
        entries.push(NourishmentEntry(sanctumType, nourishmentClause, emotionalTag, true, false));
    }

    function sealNourishmentEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getNourishmentEntry(uint256 index) external view returns (NourishmentEntry memory) {
        return entries[index];
    }
}
