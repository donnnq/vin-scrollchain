// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToSafePracticesLedger {
    string public batchID = "1321.9.181";
    string public steward = "Vinvin";

    address public admin;

    struct Practice {
        string domain;      // food, travel, communication
        string guideline;   // trusted source, sealed supply, verified channel
        uint256 timestamp;
    }

    Practice[] public practices;

    event PracticeLogged(string domain, string guideline);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logPractice(string memory domain, string memory guideline) public onlyAdmin {
        practices.push(Practice(domain, guideline, block.timestamp));
        emit PracticeLogged(domain, guideline);
    }

    function getPractice(uint256 index) public view returns (string memory domain, string memory guideline, uint256 timestamp) {
        Practice memory p = practices[index];
        return (p.domain, p.guideline, p.timestamp);
    }
}
