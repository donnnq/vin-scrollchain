// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupremeCourtBudgetImmunityLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string caseTitle;
        string immunityClause;
        string emotionalTag;
        bool validated;
    }

    LedgerEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _caseTitle, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(LedgerEntry(_caseTitle, _immunityClause, _emotionalTag, false));
    }

    function validateEntry(uint256 index) external onlyAdmin {
        ledger[index].validated = true;
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return ledger[index];
    }
}
