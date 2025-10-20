// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CannabisVoterSentimentDAO {
    address public admin;

    struct SentimentEntry {
        string region;
        string pollingResult;
        string politicalResponse;
        string emotionalTag;
        bool summoned;
        bool acknowledged;
        bool sealed;
    }

    SentimentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSentiment(string memory region, string memory pollingResult, string memory politicalResponse, string memory emotionalTag) external onlyAdmin {
        entries.push(SentimentEntry(region, pollingResult, politicalResponse, emotionalTag, true, false, false));
    }

    function confirmAcknowledgment(uint256 index) external onlyAdmin {
        entries[index].acknowledged = true;
    }

    function sealSentimentEntry(uint256 index) external onlyAdmin {
        require(entries[index].acknowledged, "Must be acknowledged first");
        entries[index].sealed = true;
    }

    function getSentimentEntry(uint256 index) external view returns (SentimentEntry memory) {
        return entries[index];
    }
}
