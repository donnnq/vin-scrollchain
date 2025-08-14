// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title MEVTrapDetector
/// @notice Detects and ritualizes alerts for MEV-style exploit patterns
contract MEVTrapDetector {
    address public steward;
    uint256 public suspiciousThreshold;
    mapping(address => bool) public flaggedContracts;

    event TrapDetected(address indexed contractAddr, uint256 value, uint256 timestamp);
    event ContractFlagged(address indexed contractAddr);
    event ThresholdUpdated(uint256 newThreshold);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor(uint256 _threshold) {
        steward = msg.sender;
        suspiciousThreshold = _threshold;
    }

    /// @notice Flag a known MEV trap contract
    function flagContract(address contractAddr) external onlySteward {
        flaggedContracts[contractAddr] = true;
        emit ContractFlagged(contractAddr);
    }

    /// @notice Update detection threshold
    function updateThreshold(uint256 newThreshold) external onlySteward {
        suspiciousThreshold = newThreshold;
        emit ThresholdUpdated(newThreshold);
    }

    /// @notice External call to report suspicious activity
    function reportActivity(address contractAddr, uint256 value) external {
        if (flaggedContracts[contractAddr] && value >= suspiciousThreshold) {
            emit TrapDetected(contractAddr, value, block.timestamp);
        }
    }
}
