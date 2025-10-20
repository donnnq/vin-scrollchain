// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SurvivalIncomeCodex {
    address public admin;

    struct IncomeEntry {
        string incomeBracket;
        string exemptionType;
        string survivalClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    IncomeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonIncomeAudit(string memory incomeBracket, string memory exemptionType, string memory survivalClause, string memory emotionalTag) external onlyAdmin {
        entries.push(IncomeEntry(incomeBracket, exemptionType, survivalClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealIncomeEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getIncomeEntry(uint256 index) external view returns (IncomeEntry memory) {
        return entries[index];
    }
}
