// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToSuccessionFlowGrid {
    string public batchID = "Succession-001";
    string public steward = "Vinvin";

    address public admin;

    struct SuccessionFlow {
        string statement;   // readiness, succession rule, communal reaction
        string source;      // VP, Palace, Constitution
        uint256 timestamp;
    }

    SuccessionFlow[] public flows;

    event SuccessionLogged(string statement, string source);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSuccession(string memory statement, string memory source) public onlyAdmin {
        flows.push(SuccessionFlow(statement, source, block.timestamp));
        emit SuccessionLogged(statement, source);
    }

    function getSuccession(uint256 index) public view returns (string memory statement, string memory source, uint256 timestamp) {
        SuccessionFlow memory s = flows[index];
        return (s.statement, s.source, s.timestamp);
    }
}
