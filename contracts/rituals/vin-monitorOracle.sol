// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title VINVIN’s Protocol Pulse Monitor
/// @notice Listens for exploit signals and records DeFi network threats

contract MonitorOracle {
    address public keeper;
    uint256 public lastPing;
    string public lastSource;

    event ProtocolPulseDetected(string source, uint256 timestamp, bool alert);
    event ProtocolScanReport(string summary, bool threatFound);

    modifier onlyKeeper() {
        require(msg.sender == keeper, "Not scrollkeeper");
        _;
    }

    constructor() {
        keeper = msg.sender;
    }

    function emitPulse(string memory source, bool alert) external onlyKeeper {
        lastPing = block.timestamp;
        lastSource = source;
        emit ProtocolPulseDetected(source, block.timestamp, alert);
    }

    function emitScanReport(string memory summary, bool threatFound) external onlyKeeper {
        emit ProtocolScanReport(summary, threatFound);
    }
}
