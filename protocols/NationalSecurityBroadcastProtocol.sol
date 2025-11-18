// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract NationalSecurityBroadcastProtocol {
    address public validator;

    struct Alert {
        string incident;
        string impact;
        string resonance;
        uint256 timestamp;
    }

    Alert[] public alerts;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastAlert(string memory _incident, string memory _impact, string memory _resonance) public onlyValidator {
        alerts.push(Alert(_incident, _impact, _resonance, block.timestamp));
    }

    function getAlert(uint256 index) public view returns (Alert memory) {
        return alerts[index];
    }

    function totalAlerts() public view returns (uint256) {
        return alerts.length;
    }
}
