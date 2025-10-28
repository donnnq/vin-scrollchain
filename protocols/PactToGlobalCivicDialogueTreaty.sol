// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PactToGlobalCivicDialogueTreaty {
    address public steward;

    struct DialogueEntry {
        string forum; // "Press briefing, civic exchange, diplomatic Q&A"
        string clause; // "Scrollchain-sealed treaty for global civic dialogue and planetary consequence"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    DialogueEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyDialogue(string memory forum, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(DialogueEntry(forum, clause, emotionalTag, true, false));
    }

    function sealDialogueEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getDialogueEntry(uint256 index) external view returns (DialogueEntry memory) {
        return entries[index];
    }
}
