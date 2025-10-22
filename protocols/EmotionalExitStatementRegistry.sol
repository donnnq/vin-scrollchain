// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmotionalExitStatementRegistry {
    address public admin;

    struct StatementEntry {
        string speaker;
        string quote;
        string exitContext;
        string emotionalTag;
        bool registered;
        bool sealed;
    }

    StatementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerStatement(string memory speaker, string memory quote, string memory exitContext, string memory emotionalTag) external onlyAdmin {
        entries.push(StatementEntry(speaker, quote, exitContext, emotionalTag, true, false));
    }

    function sealStatementEntry(uint256 index) external onlyAdmin {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getStatementEntry(uint256 index) external view returns (StatementEntry memory) {
        return entries[index];
    }
}
