// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureJusticeConstitution {
    address public admin;

    struct JusticeClause {
        string clauseLabel;
        string infrastructurePrinciple;
        string emotionalTag;
        bool ratified;
    }

    JusticeClause[] public clauses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClause(string memory clauseLabel, string memory infrastructurePrinciple, string memory emotionalTag) external onlyAdmin {
        clauses.push(JusticeClause(clauseLabel, infrastructurePrinciple, emotionalTag, false));
    }

    function ratifyClause(uint256 index) external onlyAdmin {
        clauses[index].ratified = true;
    }

    function getClause(uint256 index) external view returns (JusticeClause memory) {
        return clauses[index];
    }
}
