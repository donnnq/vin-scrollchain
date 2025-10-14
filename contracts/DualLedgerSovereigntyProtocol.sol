// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DualLedgerSovereigntyProtocol {
    address public admin;

    struct LedgerEntry {
        string transactionType;
        string dollarAmount;
        string localCurrencyAmount;
        string emotionalTag;
    }

    LedgerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logEntry(string memory _transactionType, string memory _dollarAmount, string memory _localCurrencyAmount, string memory _emotionalTag) external onlyAdmin {
        entries.push(LedgerEntry(_transactionType, _dollarAmount, _localCurrencyAmount, _emotionalTag));
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return entries[index];
    }
}
