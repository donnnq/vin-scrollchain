// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/// @title vinInfraAlertBeacon.sol
/// @notice Enables emergency alerts for delays, hazards, and site failures.

contract vinInfraAlertBeacon {
    address public director;
    uint256 public alertCount;

    struct Alert {
        uint256 id;
        string siteName;
        string issueType;
        string description;
        bool isResolved;
        uint256 timestamp;
    }

    mapping(uint256 => Alert) public alerts;

    event AlertRaised(uint256 indexed id, string issueType);
    event AlertResolved(uint256 indexed id);

    modifier onlyDirector() {
        require(msg.sender == director, "Not authorized.");
        _;
    }

    constructor() {
        director = msg.sender;
    }

    function raiseAlert(
        string memory _siteName,
        string memory _issueType,
        string memory _description
    ) public onlyDirector {
        alertCount++;
        alerts[alertCount] = Alert(alertCount, _siteName, _issueType, _description, false, block.timestamp);
        emit AlertRaised(alertCount, _issueType);
    }

    function resolveAlert(uint256 _id) public onlyDirector {
        alerts[_id].isResolved = true;
        emit AlertResolved(_id);
    }

    function viewAlert(uint256 _id) public view returns (Alert memory) {
        return alerts[_id];
    }
}
