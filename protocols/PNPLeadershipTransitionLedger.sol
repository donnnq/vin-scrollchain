// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PNPLeadershipTransitionLedger {
    address public admin;

    struct TransitionEntry {
        string officialName;
        string rank;
        string reasonForExit;
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    TransitionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logTransition(string memory officialName, string memory rank, string memory reasonForExit, string memory emotionalTag) external onlyAdmin {
        entries.push(TransitionEntry(officialName, rank, reasonForExit, emotionalTag, true, false));
    }

    function sealTransitionEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getTransitionEntry(uint256 index) external view returns (TransitionEntry memory) {
        return entries[index];
    }
}
