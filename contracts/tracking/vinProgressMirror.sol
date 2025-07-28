// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinProgressMirror {
    struct SectorProgress {
        string name;
        uint256 score;
        uint256 timestamp;
    }

    mapping(string => SectorProgress) public progressMap;
    event ProgressLogged(string name, uint256 score, uint256 timestamp);

    function logProgress(string calldata name, uint256 score) external {
        progressMap[name] = SectorProgress(name, score, block.timestamp);
        emit ProgressLogged(name, score, block.timestamp);
    }

    function getProgress(string calldata name) external view returns (SectorProgress memory) {
        return progressMap[name];
    }
}
