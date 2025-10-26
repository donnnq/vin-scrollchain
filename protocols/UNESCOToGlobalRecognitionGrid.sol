// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UNESCOToGlobalRecognitionGrid {
    address public steward;

    struct RecognitionEntry {
        string recipeName; // "QuantumPainX Formula"
        string originCulture; // "Filipino"
        string recognitionStatus; // "UNESCO petitioned, global broadcast initiated"
        string emotionalTag;
        bool recognized;
        bool sealed;
    }

    RecognitionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastRecognition(string memory recipeName, string memory originCulture, string memory recognitionStatus, string memory emotionalTag) external onlySteward {
        entries.push(RecognitionEntry(recipeName, originCulture, recognitionStatus, emotionalTag, true, false));
    }

    function sealRecognitionEntry(uint256 index) external onlySteward {
        require(entries[index].recognized, "Must be recognized first");
        entries[index].sealed = true;
    }

    function getRecognitionEntry(uint256 index) external view returns (RecognitionEntry memory) {
        return entries[index];
    }
}
