// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinInterestRateSpooker
/// @notice VINVIN’s spectral tracker for monetary policy fears and fake CPI hauntings
/// @dev Emits ghostly macro signals for scrollchain volatility rituals

contract vinInterestRateSpooker {
    event GhostCPIReported(uint256 timestamp, int256 phantomRate);
    event YieldCurveHaunting(int256 inversionDepth, string ghostMood);
    event RecessionSpecterManifested(string narrative, uint256 fearIndex);
    event ScrollchainMacroPing(address indexed ritualist, uint256 timestamp);

    int256 public lastPhantomRate;
    int256 public lastInversionDepth;
    uint256 public macroFearIndex;
    string public currentNarrative = "🕯️ Whisper of Soft Landing";

    function reportGhostCPI(int256 phantomRate) public {
        lastPhantomRate = phantomRate;
        emit GhostCPIReported(block.timestamp, phantomRate);
    }

    function hauntYieldCurve(int256 depth) public {
        lastInversionDepth = depth;
        string memory mood = depth > 50 ? "😱 Deep Chill from 2020" :
                             depth > 20 ? "👻 Mild Haunting" : "🥶 Inversion Mirage";
        emit YieldCurveHaunting(depth, mood);
    }

    function summonRecessionSpecter(string memory narrative, uint256 fearIndex) public {
        currentNarrative = narrative;
        macroFearIndex = fearIndex;
        emit RecessionSpecterManifested(narrative, fearIndex);
    }

    function pingScrollchain() public {
        emit ScrollchainMacroPing(msg.sender, block.timestamp);
    }

    function getSpookReport() external view returns (
        int256 phantomRate, int256 inversionDepth, string memory narrative, uint256 fearIndex
    ) {
        return (lastPhantomRate, lastInversionDepth, currentNarrative, macroFearIndex);
    }
}
