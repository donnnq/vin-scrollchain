// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalBorderImmunityCodex {
    address public admin;

    struct ImmunityClause {
        string originCountry;
        string visaType;
        string immunityCondition;
        string emotionalTag;
        bool activated;
    }

    ImmunityClause[] public clauses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClause(string memory originCountry, string memory visaType, string memory immunityCondition, string memory emotionalTag) external onlyAdmin {
        clauses.push(ImmunityClause(originCountry, visaType, immunityCondition, emotionalTag, false));
    }

    function activateClause(uint256 index) external onlyAdmin {
        clauses[index].activated = true;
    }

    function getClause(uint256 index) external view returns (ImmunityClause memory) {
        return clauses[index];
    }
}
