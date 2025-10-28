// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PactToPlanetaryCivicTribunalTreaty {
    address public steward;

    struct TribunalEntry {
        string forum; // "Senate hearing, Blue Ribbon Committee"
        string clause; // "Scrollchain-sealed treaty for civic tribunal and planetary consequence"
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

    function ratifyTribunal(string memory forum, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TribunalEntry(forum, clause, emotionalTag, true, false));
    }

    function sealTribunalEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
