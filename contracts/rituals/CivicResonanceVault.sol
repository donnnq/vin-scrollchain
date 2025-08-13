// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title CivicResonanceVault - Ritual-grade vault for emotional APR and civic impact logs
contract CivicResonanceVault {
    address public steward;
    uint256 public resonanceCooldown; // in seconds

    struct ResonanceLog {
        string message;
        uint256 timestamp;
        string sourceScroll;
    }

    mapping(address => ResonanceLog[]) public civicResonance;
    mapping(address => uint256) public lastResonanceTimestamp;

    event ResonanceStored(address indexed recipient, string message, string sourceScroll, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized scrollsmith");
        _;
    }

    constructor(uint256 _cooldown) {
        steward = msg.sender;
        resonanceCooldown = _cooldown;
    }

    function storeResonance(address recipient, string calldata message, string calldata sourceScroll) external onlySteward {
        require(block.timestamp >= lastResonanceTimestamp[recipient] + resonanceCooldown, "Cooldown active");

        civicResonance[recipient].push(ResonanceLog({
            message: message,
            timestamp: block.timestamp,
            sourceScroll: sourceScroll
        }));

        lastResonanceTimestamp[recipient] = block.timestamp;
        emit ResonanceStored(recipient, message, sourceScroll, block.timestamp);
    }

    function getResonanceLogs(address recipient) external view returns (ResonanceLog[] memory) {
        return civicResonance[recipient];
    }
}
