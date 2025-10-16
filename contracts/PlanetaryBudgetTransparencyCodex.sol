// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryBudgetTransparencyCodex {
    address public admin;

    struct TransparencyClause {
        string institutionLabel;
        string auditDetail;
        string emotionalTag;
        bool published;
    }

    TransparencyClause[] public clauses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClause(string memory institutionLabel, string memory auditDetail, string memory emotionalTag) external onlyAdmin {
        clauses.push(TransparencyClause(institutionLabel, auditDetail, emotionalTag, false));
    }

    function publishClause(uint256 index) external onlyAdmin {
        clauses[index].published = true;
    }

    function getClause(uint256 index) external view returns (TransparencyClause memory) {
        return clauses[index];
    }
}
