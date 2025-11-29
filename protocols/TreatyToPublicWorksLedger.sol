// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToPublicWorksLedger {
    string public batchID = "1321.9.186";
    string public steward = "Vinvin";

    address public admin;

    struct PublicWork {
        string sector;      // roads, bridges, flood control
        string description; // project details
        uint256 timestamp;
    }

    PublicWork[] public works;

    event WorkLogged(string sector, string description);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logWork(string memory sector, string memory description) public onlyAdmin {
        works.push(PublicWork(sector, description, block.timestamp));
        emit WorkLogged(sector, description);
    }

    function getWork(uint256 index) public view returns (string memory sector, string memory description, uint256 timestamp) {
        PublicWork memory w = works[index];
        return (w.sector, w.description, w.timestamp);
    }
}
