// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinScrollOracle — Ritual-grade anomaly tracker with symbolic dignity alerts
/// @author Vinvin
/// @notice Logs civic and systemic signals, emits alerts when dignity thresholds are crossed
contract vinScrollOracle {
    struct Signal {
        string description;
        uint256 timestamp;
        address observer;
    }

    Signal[] private log;
    uint256 public immutable threshold;
    mapping(address => uint256) public alertScore;

    event SignalLogged(string description, uint256 indexed timestamp, address indexed observer);
    event DignityThresholdCrossed(address indexed observer, uint256 score);

    /// @dev Initializes the dignity threshold for alerting
    constructor(uint256 _threshold) {
        require(_threshold > 0, "Threshold must be positive");
        threshold = _threshold;
    }

    /// @notice Records a symbolic signal from an observer
    /// @param _description A poetic or technical description of the anomaly
    function recordSignal(string memory _description) external {
        log.push(Signal({
            description: _description,
            timestamp: block.timestamp,
            observer: msg.sender
        }));

        alertScore[msg.sender]++;
        emit SignalLogged(_description, block.timestamp, msg.sender);

        if (alertScore[msg.sender] >= threshold) {
            emit DignityThresholdCrossed(msg.sender, alertScore[msg.sender]);
        }
    }

    /// @notice Retrieves all signals submitted by a specific observer
    /// @param _observer The address of the observer
    /// @return filtered Array of Signal structs submitted by the observer
    function getSignalsBy(address _observer) external view returns (Signal[] memory filtered) {
        uint256 count;
        for (uint256 i = 0; i < log.length; i++) {
            if (log[i].observer == _observer) count++;
        }

        filtered = new Signal[](count);
        uint256 idx;
        for (uint256 i = 0; i < log.length; i++) {
            if (log[i].observer == _observer) {
                filtered[idx++] = log[i];
            }
        }
    }

    /// @notice Returns the total number of signals recorded
    function totalSignals() external view returns (uint256) {
        return log.length;
    }

    /// @notice Retrieves a signal by index
    /// @param index The index of the signal in the log
    function getSignal(uint256 index) external view returns (Signal memory) {
        require(index < log.length, "Index out of bounds");
        return log[index];
    }
}
