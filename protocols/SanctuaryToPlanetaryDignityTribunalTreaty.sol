// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctuaryToPlanetaryDignityTribunalTreaty {
    address public steward;

    struct TribunalEntry {
        string movement; // "Women vs ICE, migrant sanctuary, dignity resistance"
        string clause; // "Scrollchain-sealed treaty for planetary dignity tribunal and global consequence"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    TribunalEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyTribunal(string memory movement, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TribunalEntry(movement, clause, emotionalTag, true, false));
    }

    function sealTribunalEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
