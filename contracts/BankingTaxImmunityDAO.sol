// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankingTaxImmunityDAO {
    address public admin;

    struct TaxClause {
        string bankName;
        string immunityReason;
        string emotionalTag;
        bool granted;
    }

    TaxClause[] public clauses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClause(string memory bankName, string memory immunityReason, string memory emotionalTag) external onlyAdmin {
        clauses.push(TaxClause(bankName, immunityReason, emotionalTag, false));
    }

    function grantClause(uint256 index) external onlyAdmin {
        clauses[index].granted = true;
    }

    function getClause(uint256 index) external view returns (TaxClause memory) {
        return clauses[index];
    }
}
