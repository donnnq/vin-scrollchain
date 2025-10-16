// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureEquityCodex {
    address public admin;

    struct EquityClause {
        string districtLabel;
        string costReductionProposal;
        string emotionalTag;
        bool ratified;
    }

    EquityClause[] public clauses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClause(string memory districtLabel, string memory costReductionProposal, string memory emotionalTag) external onlyAdmin {
        clauses.push(EquityClause(districtLabel, costReductionProposal, emotionalTag, false));
    }

    function ratifyClause(uint256 index) external onlyAdmin {
        clauses[index].ratified = true;
    }

    function getClause(uint256 index) external view returns (EquityClause memory) {
        return clauses[index];
    }
}
