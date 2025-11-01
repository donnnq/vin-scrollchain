// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToUserLedPatchSuggestionGrid {
    address public steward;

    struct SuggestionEntry {
        string projectName; // "Chromium, Blink Engine"
        string clause; // "Scrollchain-sealed grid for user-led patch suggestion and browser crash consequence"
        string emotionalTag;
        bool suggested;
        bool acknowledged;
    }

    SuggestionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function suggestPatch(string memory projectName, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(SuggestionEntry(projectName, clause, emotionalTag, true, false));
    }

    function markAcknowledged(uint256 index) external onlySteward {
        entries[index].acknowledged = true;
    }

    function getSuggestionEntry(uint256 index) external view returns (SuggestionEntry memory) {
        return entries[index];
    }
}
