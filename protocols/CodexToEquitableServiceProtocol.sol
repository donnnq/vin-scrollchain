// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToEquitableServiceProtocol {
    string public batchID = "1321.9.116";
    string public steward = "Vinvin";

    address public admin;

    struct Principle {
        string sector;
        string equityClause;
        uint256 timestamp;
    }

    Principle[] public principles;

    event PrincipleCodified(string sector, string equityClause);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function codifyPrinciple(string memory sector, string memory equityClause) public onlyAdmin {
        principles.push(Principle(sector, equityClause, block.timestamp));
        emit PrincipleCodified(sector, equityClause);
    }

    function getPrinciple(uint256 index) public view returns (string memory sector, string memory equityClause, uint256 timestamp) {
        Principle memory p = principles[index];
        return (p.sector, p.equityClause, p.timestamp);
    }
}
