// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvestorLimboProtocol {
    address public admin;

    struct LimboEntry {
        string sector; // "Cannabis", "Biotech", "Retail"
        string delayImpact; // "Stock Freeze", "Capital Hesitation", "Legal Risk"
        string emotionalTag;
        bool summoned;
        bool assessed;
        bool sealed;
    }

    LimboEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLimbo(string memory sector, string memory delayImpact, string memory emotionalTag) external onlyAdmin {
        entries.push(LimboEntry(sector, delayImpact, emotionalTag, true, false, false));
    }

    function confirmAssessment(uint256 index) external onlyAdmin {
        entries[index].assessed = true;
    }

    function sealLimboEntry(uint256 index) external onlyAdmin {
        require(entries[index].assessed, "Must be assessed first");
        entries[index].sealed = true;
    }

    function getLimboEntry(uint256 index) external view returns (LimboEntry memory) {
        return entries[index];
    }
}
