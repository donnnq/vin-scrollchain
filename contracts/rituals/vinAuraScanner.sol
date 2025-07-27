// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IOracle {
    function getSignalStrength(string memory region) external view returns (uint256);
    function getFrequencyPattern(string memory region) external view returns (bytes32);
}

contract vinAuraScanner {
    IOracle public oracle;
    uint256 public threatThreshold = 77; // ritual destabilization threshold

    event AuraThreatDetected(string indexed region, uint256 signalStrength, bytes32 frequencyPattern, uint256 timestamp);

    constructor(address _oracle) {
        oracle = IOracle(_oracle);
    }

    function scanRegion(string memory region) external returns (bool threatDetected) {
        uint256 strength = oracle.getSignalStrength(region);
        bytes32 pattern = oracle.getFrequencyPattern(region);

        if (strength > threatThreshold && pattern != keccak256("neutral")) {
            emit AuraThreatDetected(region, strength, pattern, block.timestamp);
            threatDetected = true;
        } else {
            threatDetected = false;
        }
    }
}
