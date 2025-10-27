// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PerformerToCivicTalentRegistryGrid {
    address public steward;

    struct TalentEntry {
        string performer; // "Busker, spoken word artist, acoustic duo"
        string clause; // "Scrollchain-sealed grid for civic talent indexing, performance equity, and cultural sovereignty"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    TalentEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexTalent(string memory performer, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TalentEntry(performer, clause, emotionalTag, true, false));
    }

    function sealTalentEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getTalentEntry(uint256 index) external view returns (TalentEntry memory) {
        return entries[index];
    }
}
