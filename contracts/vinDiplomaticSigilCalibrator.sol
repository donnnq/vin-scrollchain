// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface BroadcastMoodOracle {
    function getHostilityLevel(string calldata country) external view returns (uint256);
}

contract vinDiplomaticSigilCalibrator {
    address public commander;
    uint256 public escalationBias = 5; // Always stay one glyph ahead

    struct CounterSigil {
        string country;
        uint256 incomingHostility;
        uint256 calibratedGlyphScore;
        uint256 timestamp;
    }

    CounterSigil[] public archive;
    BroadcastMoodOracle public oracle;

    event SigilCalibrated(string country, uint256 score, string tone);

    modifier onlyCommander() {
        require(msg.sender == commander, "Not authorized");
        _;
    }

    constructor(address oracleAddress) {
        commander = msg.sender;
        oracle = BroadcastMoodOracle(oracleAddress);
    }

    function calibrate(string calldata country) external onlyCommander {
        uint256 hostility = oracle.getHostilityLevel(country);
        uint256 glyphScore = hostility + escalationBias;

        archive.push(CounterSigil({
            country: country,
            incomingHostility: hostility,
            calibratedGlyphScore: glyphScore,
            timestamp: block.timestamp
        }));

        string memory tone = glyphScore >= 90 ? "Aggressive Tone" : glyphScore >= 75 ? "Assertive Tone" : "Watchful Tone";
        emit SigilCalibrated(country, glyphScore, tone);
    }

    function getLatestCalibration() external view returns (CounterSigil memory) {
        return archive[archive.length - 1];
    }

    function setBias(uint256 newBias) external onlyCommander {
        escalationBias = newBias;
    }
}
