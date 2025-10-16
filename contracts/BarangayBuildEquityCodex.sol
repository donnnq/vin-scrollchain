// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayBuildEquityCodex {
    address public admin;

    struct BuildClause {
        string purokLabel;
        string infrastructureType;
        string equityProposal;
        string emotionalTag;
        bool ratified;
    }

    BuildClause[] public clauses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClause(string memory purokLabel, string memory infrastructureType, string memory equityProposal, string memory emotionalTag) external onlyAdmin {
        clauses.push(BuildClause(purokLabel, infrastructureType, equityProposal, emotionalTag, false));
    }

    function ratifyClause(uint256 index) external onlyAdmin {
        clauses[index].ratified = true;
    }

    function getClause(uint256 index) external view returns (BuildClause memory) {
        return clauses[index];
    }
}
