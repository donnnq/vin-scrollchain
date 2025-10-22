// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICIQuoteSovereigntyRegistry {
    address public admin;

    struct QuoteEntry {
        string speaker;
        string quote;
        string context;
        string emotionalTag;
        bool registered;
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

    function registerQuote(string memory speaker, string memory quote, string memory context, string memory emotionalTag) external onlyAdmin {
        entries.push(QuoteEntry(speaker, quote, context, emotionalTag, true, false));
    }

    function sealQuoteEntry(uint256 index) external onlyAdmin {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getQuoteEntry(uint256 index) external view returns (QuoteEntry memory) {
        return entries[index];
    }
}
