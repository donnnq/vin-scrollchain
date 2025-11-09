// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DeforestationAlertBroadcastDAO {
    address public validator;

    struct Alert {
        string location;
        string cause;
        string severity;
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

    function broadcastAlert(string memory _location, string memory _cause, string memory _severity) public onlyValidator {
        alerts.push(Alert(_location, _cause, _severity, block.timestamp));
    }

    function getAlert(uint256 index) public view returns (Alert memory) {
        return alerts[index];
    }

    function totalAlerts() public view returns (uint256) {
        return alerts.length;
    }
}
