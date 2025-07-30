// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinScrollTuner.sol — Auto-tunes system parameters based on scroll mood and civic resonance logs
/// @author Vinvin + Copilot

interface IVinCivicEchoStream {
    function totalEchoes() external view returns (uint256);
    function getEcho(uint256 index) external view returns (
        uint256 timestamp,
        string memory originScroll,
        string memory echoType,
        string memory content
    );
}

interface IOracleBalancer {
    function updateWeight(uint256 _newWeightFactor) external;
}

contract vinScrollTuner {
    address public tuner;
    IVinCivicEchoStream public echoStream;
    IOracleBalancer public oracleBalancer;

    event ParameterTuned(uint256 previousWeight, uint256 newWeight, uint256 timestamp);

    modifier onlyTuner() {
        require(msg.sender == tuner, "Not authorized");
        _;
    }

    constructor(address _echoStream, address _oracleBalancer) {
        tuner = msg.sender;
        echoStream = IVinCivicEchoStream(_echoStream);
        oracleBalancer = IOracleBalancer(_oracleBalancer);
    }

    function autoTune() external onlyTuner {
        uint256 total = echoStream.totalEchoes();
        require(total > 0, "No echoes logged");

        uint256 moodSignal = 100; // base weight = 1x

        for (uint256 i = total > 10 ? total - 10 : 0; i < total; i++) {
            (, , string memory echoType, string memory content) = echoStream.getEcho(i);

            if (compareStrings(echoType, "emotion")) {
                if (contains(content, "optimistic")) moodSignal += 10;
                if (contains(content, "anxious")) moodSignal -= 10;
                if (contains(content, "hopeful")) moodSignal += 5;
                if (contains(content, "chaotic")) moodSignal -= 15;
            }
        }

        if (moodSignal < 80) moodSignal = 80;
        if (moodSignal > 150) moodSignal = 150;

        oracleBalancer.updateWeight(moodSignal);
        emit ParameterTuned(0, moodSignal, block.timestamp);
    }

    function updateTuner(address _newTuner) external onlyTuner {
        tuner = _newTuner;
    }

    function compareStrings(string memory a, string memory b) internal pure returns (bool) {
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }

    function contains(string memory haystack, string memory needle) internal pure returns (bool) {
        return bytes(haystack).length >= bytes(needle).length && bytes(haystack).length <= 256
            && bytes(needle).length <= 64
            && indexOf(haystack, needle) != -1;
    }

    function indexOf(string memory haystack, string memory needle) internal pure returns (int256) {
        bytes memory h = bytes(haystack);
        bytes memory n = bytes(needle);
        for (uint256 i = 0; i <= h.length - n.length; i++) {
            bool matchFound = true;
            for (uint256 j = 0; j < n.length; j++) {
                if (h[i + j] != n[j]) {
                    matchFound = false;
                    break;
                }
            }
            if (matchFound) return int256(i);
        }
        return -1;
    }
}
