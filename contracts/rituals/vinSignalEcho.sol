// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinSignalEcho {
    struct Echo {
        string origin;
        string distortionType;
        uint256 intensity; // 0–100
        uint256 timestamp;
    }

    Echo[] public echoes;

    event SignalEchoed(string origin, string distortionType, uint256 intensity, uint256 timestamp);

    function bounceSignal(string memory origin, string memory distortionType, uint256 intensity) public {
        require(intensity <= 100, "Distortion too mythic.");
        echoes.push(Echo(origin, distortionType, intensity, block.timestamp));
        emit SignalEchoed(origin, distortionType, intensity, block.timestamp);
    }

    function getRecentEchoes(uint count) public view returns (Echo[] memory) {
        require(count <= echoes.length, "Not enough echoes.");
        Echo[] memory recent = new Echo[](count);
        for (uint i = 0; i < count; i++) {
            recent[i] = echoes[echoes.length - 1 - i];
        }
        return recent;
    }
}
