// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SWSSentimentAmplificationIndex {
    address public steward;

    struct SentimentEntry {
        string surveySource; // "SWS", "Pulse Asia", "Barangay poll"
        string civicPriority; // "Fix corruption first", "Housing equity", "Youth employment"
        uint256 supportPercentage;
        string emotionalTag;
        bool amplified;
        bool sealed;
    }

    SentimentEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function amplifySentiment(string memory surveySource, string memory civicPriority, uint256 supportPercentage, string memory emotionalTag) external onlySteward {
        require(supportPercentage >= 50, "Must reflect majority sentiment");
        entries.push(SentimentEntry(surveySource, civicPriority, supportPercentage, emotionalTag, true, false));
    }

    function sealSentimentEntry(uint256 index) external onlySteward {
        require(entries[index].amplified, "Must be amplified first");
        entries[index].sealed = true;
    }

    function getSentimentEntry(uint256 index) external view returns (SentimentEntry memory) {
        return entries[index];
    }
}
