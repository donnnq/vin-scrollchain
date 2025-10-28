// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestimonyToDiplomaticConsequenceGrid {
    address public steward;

    struct ConsequenceEntry {
        string testimony; // "Family statements, diplomatic pledges"
        string clause; // "Scrollchain-sealed grid for diplomatic consequence and planetary justice"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ConsequenceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexTestimony(string memory testimony, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ConsequenceEntry(testimony, clause, emotionalTag, true, false));
    }

    function sealConsequenceEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getConsequenceEntry(uint256 index) external view returns (ConsequenceEntry memory) {
        return entries[index];
    }
}
