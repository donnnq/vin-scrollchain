// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToEquityLedger {
    string public batchID = "1321.9.163";
    string public steward = "Vinvin";

    address public admin;

    struct EquityAction {
        string measure;     // subsidy, incentive, PPP
        string target;      // agency, operator
        uint256 timestamp;
    }

    EquityAction[] public actions;

    event EquityLogged(string measure, string target);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logEquity(string memory measure, string memory target) public onlyAdmin {
        actions.push(EquityAction(measure, target, block.timestamp));
        emit EquityLogged(measure, target);
    }

    function getEquity(uint256 index) public view returns (string memory measure, string memory target, uint256 timestamp) {
        EquityAction memory e = actions[index];
        return (e.measure, e.target, e.timestamp);
    }
}
