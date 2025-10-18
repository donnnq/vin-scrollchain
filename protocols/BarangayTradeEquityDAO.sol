// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayTradeEquityDAO {
    address public admin;

    struct TradeEntry {
        string productName;
        string barangay;
        string creator;
        string emotionalTag;
        bool summoned;
        bool approved;
        bool distributed;
    }

    TradeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTrade(string memory productName, string memory barangay, string memory creator, string memory emotionalTag) external onlyAdmin {
        entries.push(TradeEntry(productName, barangay, creator, emotionalTag, true, false, false));
    }

    function approveTrade(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function distributeTrade(uint256 index) external onlyAdmin {
        require(entries[index].approved, "Must be approved first");
        entries[index].distributed = true;
    }

    function getTradeEntry(uint256 index) external view returns (TradeEntry memory) {
        return entries[index];
    }
}
