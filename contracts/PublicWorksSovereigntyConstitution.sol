// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicWorksSovereigntyConstitution {
    address public admin;

    struct SovereigntyClause {
        string clauseLabel;
        string infrastructurePrinciple;
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

    function submitClause(string memory clauseLabel, string memory infrastructurePrinciple, string memory emotionalTag) external onlyAdmin {
        clauses.push(SovereigntyClause(clauseLabel, infrastructurePrinciple, emotionalTag, false));
    }

    function ratifyClause(uint256 index) external onlyAdmin {
        clauses[index].ratified = true;
    }

    function getClause(uint256 index) external view returns (SovereigntyClause memory) {
        return clauses[index];
    }
}
