// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToDefenseLedger {
    string public batchID = "1321.9.174";
    string public steward = "Vinvin";

    address public admin;

    struct DefenseAction {
        string measure;     // patch, firewall, audit, remediation
        string target;      // system, package, network
        uint256 timestamp;
    }

    DefenseAction[] public actions;

    event DefenseLogged(string measure, string target);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logDefense(string memory measure, string memory target) public onlyAdmin {
        actions.push(DefenseAction(measure, target, block.timestamp));
        emit DefenseLogged(measure, target);
    }

    function getDefense(uint256 index) public view returns (string memory measure, string memory target, uint256 timestamp) {
        DefenseAction memory d = actions[index];
        return (d.measure, d.target, d.timestamp);
    }
}
