// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICIEmotionalQuoteArchive {
    address public admin;

    struct QuoteEntry {
        string speaker;
        string quote;
        string eventContext;
        string emotionalTag;
        bool archived;
        bool sealed;
    }

    QuoteEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function archiveQuote(string memory speaker, string memory quote, string memory eventContext, string memory emotionalTag) external onlyAdmin {
        entries.push(QuoteEntry(speaker, quote, eventContext, emotionalTag, true, false));
    }

    function sealQuoteEntry(uint256 index) external onlyAdmin {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getQuoteEntry(uint256 index) external view returns (QuoteEntry memory) {
        return entries[index];
    }
}
