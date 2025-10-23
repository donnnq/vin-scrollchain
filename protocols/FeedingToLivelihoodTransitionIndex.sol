// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FeedingToLivelihoodTransitionIndex {
    address public steward;

    struct TransitionEntry {
        string householdID;
        string previousSupportType; // "Feeding program", "Food pack", "Barangay meal"
        string newLivelihoodType; // "Online selling", "Barangay coop", "Remote work"
        string emotionalTag;
        bool transitioned;
        bool sealed;
    }

    TransitionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logTransition(string memory householdID, string memory previousSupportType, string memory newLivelihoodType, string memory emotionalTag) external onlySteward {
        entries.push(TransitionEntry(householdID, previousSupportType, newLivelihoodType, emotionalTag, true, false));
    }

    function sealTransitionEntry(uint256 index) external onlySteward {
        require(entries[index].transitioned, "Must be transitioned first");
        entries[index].sealed = true;
    }

    function getTransitionEntry(uint256 index) external view returns (TransitionEntry memory) {
        return entries[index];
    }
}
