// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TeenMentorPairingGrid {
    address public steward;

    struct PairingEntry {
        string teenName;
        string mentorName;
        string skillFocus; // "Digital art", "Coding", "Crafts", "Online selling"
        string emotionalTag;
        bool paired;
        bool sealed;
    }

    PairingEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function pairMentor(string memory teenName, string memory mentorName, string memory skillFocus, string memory emotionalTag) external onlySteward {
        entries.push(PairingEntry(teenName, mentorName, skillFocus, emotionalTag, true, false));
    }

    function sealPairingEntry(uint256 index) external onlySteward {
        require(entries[index].paired, "Must be paired first");
        entries[index].sealed = true;
    }

    function getPairingEntry(uint256 index) external view returns (PairingEntry memory) {
        return entries[index];
    }
}
