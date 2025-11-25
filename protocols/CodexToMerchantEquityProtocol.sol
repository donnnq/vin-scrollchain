// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToMerchantEquityProtocol {
    string public batchID = "1321.9.119";
    string public steward = "Vinvin";

    address public admin;

    struct EquityClause {
        string principle;
        string description;
        uint256 timestamp;
    }

    EquityClause[] public clauses;

    event ClauseCodified(string principle, string description);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function codifyClause(string memory principle, string memory description) public onlyAdmin {
        clauses.push(EquityClause(principle, description, block.timestamp));
        emit ClauseCodified(principle, description);
    }

    function getClause(uint256 index) public view returns (string memory principle, string memory description, uint256 timestamp) {
        EquityClause memory c = clauses[index];
        return (c.principle, c.description, c.timestamp);
    }
}
