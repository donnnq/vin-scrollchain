// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalTradeCodex {
    address public admin;

    struct TradeEntry {
        string platformName;
        string tradeType;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    TradeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTradeAudit(string memory platformName, string memory tradeType, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TradeEntry(platformName, tradeType, auditClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealTradeEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getTradeEntry(uint256 index) external view returns (TradeEntry memory) {
        return entries[index];
    }
}
