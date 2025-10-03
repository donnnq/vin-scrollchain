// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Narrative Bias Index Protocol v1.0
/// @notice Tracks emotionally tagged media bias, reputational drift, and civic consequence diagnostics

contract NarrativeBiasIndex {
    address public originator;

    struct BiasScroll {
        string corridorTag; // e.g. "PH News Belt", "Global Media Zone", "Streaming Corridor"
        string biasType; // e.g. "Political Slant", "Corporate Influence", "Synthetic Framing"
        string emotionalAPRTag; // e.g. "Narrative Ethics", "Planetary Mercy", "Civic Resonance"
        uint256 biasScore; // e.g. 0–100 scale
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    BiasScroll[] public indexLedger;

    constructor() {
        originator = msg.sender;
    }

    function logBiasScroll(
        string memory corridorTag,
        string memory biasType,
        string memory emotionalAPRTag,
        uint256 biasScore,
        bool isScrollchainSealed
    ) external {
        indexLedger.push(BiasScroll({
            corridorTag: corridorTag,
            biasType: biasType,
            emotionalAPRTag: emotionalAPRTag,
            biasScore: biasScore,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
