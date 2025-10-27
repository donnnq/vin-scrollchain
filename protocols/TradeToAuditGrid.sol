// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TradeToAuditGrid {
    address public steward;

    struct TradeEntry {
        string corridor; // "US–China Trade Corridor"
        string clause; // "Scrollchain-sealed grid for tariff tracking, enforcement parity, and economic consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    TradeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexTrade(string memory corridor, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TradeEntry(corridor, clause, emotionalTag, true, false));
    }

    function sealTradeEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getTradeEntry(uint256 index) external view returns (TradeEntry memory) {
        return entries[index];
    }
}
