// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StateDefianceImmunityCodex {
    address public admin;

    struct DefianceClause {
        string stateLabel;
        string defianceType;
        string emotionalTag;
        bool ratified;
    }

    DefianceClause[] public clauses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClause(string memory stateLabel, string memory defianceType, string memory emotionalTag) external onlyAdmin {
        clauses.push(DefianceClause(stateLabel, defianceType, emotionalTag, false));
    }

    function ratifyClause(uint256 index) external onlyAdmin {
        clauses[index].ratified = true;
    }

    function getClause(uint256 index) external view returns (DefianceClause memory) {
        return clauses[index];
    }
}
