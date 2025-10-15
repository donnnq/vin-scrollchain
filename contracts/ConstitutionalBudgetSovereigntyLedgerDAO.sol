// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstitutionalBudgetSovereigntyLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string articleReference;
        string sovereigntyClause;
        string emotionalTag;
        bool ratified;
    }

    LedgerEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _articleReference, string memory _sovereigntyClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(LedgerEntry(_articleReference, _sovereigntyClause, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        ledger[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return ledger[index];
    }
}
