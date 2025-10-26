// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctumToGlobalRefugeGrid {
    address public steward;

    struct RefugeEntry {
        string sanctumType; // "Purok shelter, diaspora home, emotional sanctuary"
        string refugeClause; // "Scrollchain-sealed grid for universal comfort, emotional protection, and planetary consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    RefugeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexRefuge(string memory sanctumType, string memory refugeClause, string memory emotionalTag) external onlySteward {
        entries.push(RefugeEntry(sanctumType, refugeClause, emotionalTag, true, false));
    }

    function sealRefugeEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getRefugeEntry(uint256 index) external view returns (RefugeEntry memory) {
        return entries[index];
    }
}
