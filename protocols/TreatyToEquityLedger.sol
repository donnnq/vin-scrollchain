// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToEquityLedger {
    string public batchID = "1321.9.166";
    string public steward = "Vinvin";

    address public admin;

    struct EquityAction {
        string reform;     // resource allocation, scholarship, training
        string target;     // school, teacher, student
        uint256 timestamp;
    }

    EquityAction[] public actions;

    event EquityLogged(string reform, string target);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logEquity(string memory reform, string memory target) public onlyAdmin {
        actions.push(EquityAction(reform, target, block.timestamp));
        emit EquityLogged(reform, target);
    }

    function getEquity(uint256 index) public view returns (string memory reform, string memory target, uint256 timestamp) {
        EquityAction memory e = actions[index];
        return (e.reform, e.target, e.timestamp);
    }
}
