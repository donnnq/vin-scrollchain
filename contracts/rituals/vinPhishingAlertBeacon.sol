// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinPhishingAlertBeacon
/// @notice Broadcasts phishing alerts and tracks suspicious communications
/// @dev Designed to protect breach victims from targeted scams

contract vinPhishingAlertBeacon {
    address public scrollcaster;

    struct PhishingAlert {
        string source;
        string method; // e.g., SMS, email, call
        string messageSample;
        uint256 timestamp;
    }

    mapping(address => PhishingAlert[]) public alerts;

    event AlertBroadcasted(address indexed victim, string source, string method);

    modifier onlyScrollcaster() {
        require(msg.sender == scrollcaster, "Not authorized");
        _;
    }

    constructor() {
        scrollcaster = msg.sender;
    }

    function broadcastAlert(
        address victim,
        string memory source,
        string memory method,
        string memory messageSample
    ) public onlyScrollcaster {
        alerts[victim].push(PhishingAlert({
            source: source,
            method: method,
            messageSample: messageSample,
            timestamp: block.timestamp
        }));

        emit AlertBroadcasted(victim, source, method);
    }

    function getAlerts(address victim) public view returns (PhishingAlert[] memory) {
        return alerts[victim];
    }
}
