// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalRecipeEquityLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string recipeName;
        string originRegion;
        string equityClause;
        string emotionalTag;
        bool registered;
    }

    LedgerEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _recipeName, string memory _originRegion, string memory _equityClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(LedgerEntry(_recipeName, _originRegion, _equityClause, _emotionalTag, false));
    }

    function registerEntry(uint256 index) external onlyAdmin {
        ledger[index].registered = true;
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return ledger[index];
    }
}
