// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToSideLaneGrid {
    string public batchID = "1321.9.167";
    string public steward = "Vinvin";

    address public admin;

    struct SideLaneRule {
        string vehicleType;   // e-tricycle, e-jeep
        string lane;          // outermost, feeder, restricted
        string status;        // allowed, restricted, banned
        uint256 timestamp;
    }

    SideLaneRule[] public rules;

    event RuleLogged(string vehicleType, string lane, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logRule(string memory vehicleType, string memory lane, string memory status) public onlyAdmin {
        rules.push(SideLaneRule(vehicleType, lane, status, block.timestamp));
        emit RuleLogged(vehicleType, lane, status);
    }

    function getRule(uint256 index) public view returns (string memory vehicleType, string memory lane, string memory status, uint256 timestamp) {
        SideLaneRule memory r = rules[index];
        return (r.vehicleType, r.lane, r.status, r.timestamp);
    }
}
