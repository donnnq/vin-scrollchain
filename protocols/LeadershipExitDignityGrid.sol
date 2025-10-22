// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LeadershipExitDignityGrid {
    address public admin;

    struct ExitEntry {
        string leaderName;
        string institution;
        string exitContext; // "Relieved from post", "Voluntary resignation", etc.
        string dignitySignal; // "Life goes on", "I will explore new things", etc.
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    ExitEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logExit(string memory leaderName, string memory institution, string memory exitContext, string memory dignitySignal, string memory emotionalTag) external onlyAdmin {
        entries.push(ExitEntry(leaderName, institution, exitContext, dignitySignal, emotionalTag, true, false));
    }

    function sealExitEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getExitEntry(uint256 index) external view returns (ExitEntry memory) {
        return entries[index];
    }
}
