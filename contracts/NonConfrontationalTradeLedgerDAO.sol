// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NonConfrontationalTradeLedgerDAO {
    address public admin;

    struct TradeEntry {
        string countryLabel;
        string tradeClause;
        string emotionalTag;
        bool adjusted;
    }

    TradeEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _countryLabel, string memory _tradeClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(TradeEntry(_countryLabel, _tradeClause, _emotionalTag, false));
    }

    function markAdjusted(uint256 index) external onlyAdmin {
        ledger[index].adjusted = true;
    }

    function getEntry(uint256 index) external view returns (TradeEntry memory) {
        return ledger[index];
    }
}
