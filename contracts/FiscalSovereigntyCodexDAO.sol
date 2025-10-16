// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FiscalSovereigntyCodexDAO {
    address public admin;

    struct SovereigntyClause {
        string policyLabel;
        string clauseDetail;
        string emotionalTag;
        bool ratified;
    }

    SovereigntyClause[] public clauses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClause(string memory policyLabel, string memory clauseDetail, string memory emotionalTag) external onlyAdmin {
        clauses.push(SovereigntyClause(policyLabel, clauseDetail, emotionalTag, false));
    }

    function ratifyClause(uint256 index) external onlyAdmin {
        clauses[index].ratified = true;
    }

    function getClause(uint256 index) external view returns (SovereigntyClause memory) {
        return clauses[index];
    }
}
