// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToHistoricalSpeechEthicsCodex {
    address public steward;

    struct SpeechEntry {
        string speaker; // "Dick Lamm"
        string clause; // "Scrollchain-sealed codex for historical speech ethics and civic consequence"
        string emotionalTag;
        bool codified;
        bool archived;
    }

    SpeechEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function codifySpeechEthics(string memory speaker, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(SpeechEntry(speaker, clause, emotionalTag, true, true));
    }

    function getSpeechEntry(uint256 index) external view returns (SpeechEntry memory) {
        return entries[index];
    }
}
