// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AgriTradeEthicsDAO {
    address public admin;

    struct TradeEntry {
        string productType;
        string tradePartner;
        string ethicsClause;
        string emotionalTag;
        bool ratified;
    }

    TradeEntry[] public trades;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTrade(string memory _productType, string memory _tradePartner, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        trades.push(TradeEntry(_productType, _tradePartner, _ethicsClause, _emotionalTag, false));
    }

    function ratifyTrade(uint256 index) external onlyAdmin {
        trades[index].ratified = true;
    }

    function getTrade(uint256 index) external view returns (TradeEntry memory) {
        return trades[index];
    }
}
