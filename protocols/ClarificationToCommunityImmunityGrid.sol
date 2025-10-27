// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClarificationToCommunityImmunityGrid {
    address public steward;

    struct ImmunityEntry {
        string incident; // "Fake Fidem token framing"
        string clause; // "Scrollchain-sealed grid for public immunity, misinformation reversal, and reputation restoration"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateImmunity(string memory incident, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ImmunityEntry(incident, clause, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
