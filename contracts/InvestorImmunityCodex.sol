// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvestorImmunityCodex {
    address public admin;

    struct ImmunityClause {
        string investorType;
        string protectionScope;
        string emotionalTag;
        bool ratified;
    }

    ImmunityClause[] public clauses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClause(string memory investorType, string memory protectionScope, string memory emotionalTag) external onlyAdmin {
        clauses.push(ImmunityClause(investorType, protectionScope, emotionalTag, false));
    }

    function ratifyClause(uint256 index) external onlyAdmin {
        clauses[index].ratified = true;
    }

    function getClause(uint256 index) external view returns (ImmunityClause memory) {
        return clauses[index];
    }
}
