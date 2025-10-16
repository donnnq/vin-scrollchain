// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LGUBudgetImmunityPack {
    address public admin;

    struct ImmunityClause {
        string LGULabel;
        string budgetConcern;
        string emotionalTag;
        bool granted;
    }

    ImmunityClause[] public clauses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClause(string memory LGULabel, string memory budgetConcern, string memory emotionalTag) external onlyAdmin {
        clauses.push(ImmunityClause(LGULabel, budgetConcern, emotionalTag, false));
    }

    function grantClause(uint256 index) external onlyAdmin {
        clauses[index].granted = true;
    }

    function getClause(uint256 index) external view returns (ImmunityClause memory) {
        return clauses[index];
    }
}
