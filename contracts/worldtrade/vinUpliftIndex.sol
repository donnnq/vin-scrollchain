// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinUpliftIndex {
    address public oracle = msg.sender;

    mapping(string => uint256) public upliftScore;

    event UpliftScoreUpdated(string region, uint256 score);

    function setUpliftScore(string memory region, uint256 score) public {
        upliftScore[region] = score;
        emit UpliftScoreUpdated(region, score);
    }

    function getLowestRegion(string[] memory regions) public view returns (string memory) {
        string memory weakest = regions[0];
        uint256 min = upliftScore[weakest];
        for (uint i = 1; i < regions.length; i++) {
            if (upliftScore[regions[i]] < min) {
                min = upliftScore[regions[i]];
                weakest = regions[i];
            }
        }
        return weakest;
    }
}
