// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinOracleBalancer.sol — Dynamically reweights oracle data based on scroll resonance and trade pulse
/// @author Vinvin + Copilot

interface IExternalOracle {
    function getCurrentValue() external view returns (uint256);
}

contract vinOracleBalancer {
    address public balancer;
    IExternalOracle public externalOracle;
    uint256 public weightFactor; // 1x = 100, 1.25x = 125, etc.
    uint256 public lastSyncedValue;

    event OracleSynced(uint256 rawValue, uint256 weightedValue, uint256 timestamp);
    event WeightUpdated(uint256 oldWeight, uint256 newWeight);
    event OracleUpdated(address newOracle);

    modifier onlyBalancer() {
        require(msg.sender == balancer, "Not authorized");
        _;
    }

    constructor(address _oracleAddress, uint256 _initialWeightFactor) {
        balancer = msg.sender;
        externalOracle = IExternalOracle(_oracleAddress);
        weightFactor = _initialWeightFactor;
    }

    function syncOracle() external onlyBalancer {
        uint256 rawValue = externalOracle.getCurrentValue();
        uint256 adjustedValue = (rawValue * weightFactor) / 100;
        lastSyncedValue = adjustedValue;

        emit OracleSynced(rawValue, adjustedValue, block.timestamp);
    }

    function updateWeight(uint256 _newWeightFactor) external onlyBalancer {
        require(_newWeightFactor >= 50 && _newWeightFactor <= 200, "Out of bounds");
        emit WeightUpdated(weightFactor, _newWeightFactor);
        weightFactor = _newWeightFactor;
    }

    function updateOracle(address _newOracleAddr) external onlyBalancer {
        externalOracle = IExternalOracle(_newOracleAddr);
        emit OracleUpdated(_newOracleAddr);
    }

    function getWeightedValue() external view returns (uint256) {
        return lastSyncedValue;
    }
}
