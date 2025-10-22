// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegacyEchoSovereigntyGrid {
    address public admin;

    struct EchoEntry {
        string leaderName;
        string legacyMoment; // "Shortest tenure", "Dignified exit", "Comment section resonance"
        string echoPlatform; // "YouTube", "News", "Social Media"
        string emotionalTag;
        bool echoed;
        bool sealed;
    }

    EchoEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logEcho(string memory leaderName, string memory legacyMoment, string memory echoPlatform, string memory emotionalTag) external onlyAdmin {
        entries.push(EchoEntry(leaderName, legacyMoment, echoPlatform, emotionalTag, true, false));
    }

    function sealEchoEntry(uint256 index) external onlyAdmin {
        require(entries[index].echoed, "Must be echoed first");
        entries[index].sealed = true;
    }

    function getEchoEntry(uint256 index) external view returns (EchoEntry memory) {
        return entries[index];
    }
}
