// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToFoodSecurityLedger {
    string public batchID = "1321.9.170";
    string public steward = "Vinvin";

    address public admin;

    struct SecurityAction {
        string measure;     // subsidy, logistics, storage
        string target;      // farmer, fisherfolk, distributor
        uint256 timestamp;
    }

    SecurityAction[] public actions;

    event SecurityLogged(string measure, string target);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSecurity(string memory measure, string memory target) public onlyAdmin {
        actions.push(SecurityAction(measure, target, block.timestamp));
        emit SecurityLogged(measure, target);
    }

    function getSecurity(uint256 index) public view returns (string memory measure, string memory target, uint256 timestamp) {
        SecurityAction memory s = actions[index];
        return (s.measure, s.target, s.timestamp);
    }
}
