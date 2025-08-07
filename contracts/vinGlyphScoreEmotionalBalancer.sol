// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface CivicPulseOracle {
    function getCivicTensionIndex() external view returns (uint256);
}

contract vinGlyphScoreEmotionalBalancer {
    address public dignitary;
    uint256 public maxSafeGlyphScore = 80;

    CivicPulseOracle public pulseOracle;

    event GlyphScoreNeutralized(uint256 originalScore, uint256 balancedScore);
    event DignityOverrideTriggered(string rationale);

    modifier onlyDignitary() {
        require(msg.sender == dignitary, "Not authorized");
        _;
    }

    constructor(address oracleAddress) {
        dignitary = msg.sender;
        pulseOracle = CivicPulseOracle(oracleAddress);
    }

    function neutralizeScore(uint256 incomingScore) public returns (uint256) {
        uint256 tension = pulseOracle.getCivicTensionIndex();
        uint256 balancedScore = incomingScore;

        if (tension > 88 && incomingScore > maxSafeGlyphScore) {
            balancedScore = maxSafeGlyphScore;
            emit GlyphScoreNeutralized(incomingScore, balancedScore);
        }

        if (tension > 95) {
            emit DignityOverrideTriggered("Dignity beacon activated to prevent sigil backlash.");
        }

        return balancedScore;
    }

    function updateSafeLimit(uint256 newLimit) external onlyDignitary {
        maxSafeGlyphScore = newLimit;
    }
}
