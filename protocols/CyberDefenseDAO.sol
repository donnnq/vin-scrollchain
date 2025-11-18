// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CyberDefenseDAO {
    address public validator;

    struct Incident {
        string actor;
        string method;
        string system;
        string defenseTag;
        uint256 timestamp;
    }

    Incident[] public incidents;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logIncident(string memory _actor, string memory _method, string memory _system, string memory _tag) public onlyValidator {
        incidents.push(Incident(_actor, _method, _system, _tag, block.timestamp));
    }

    function getIncident(uint256 index) public view returns (Incident memory) {
        return incidents[index];
    }

    function totalIncidents() public view returns (uint256) {
        return incidents.length;
    }
}
