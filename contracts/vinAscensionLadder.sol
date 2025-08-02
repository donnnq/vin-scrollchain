// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinAscensionLadder {
    mapping(address => uint256) public rank;

    event RankUpdated(address indexed worker, uint256 newRank);

    function updateRank(address worker, uint256 newRank) public {
        rank[worker] = newRank;
        emit RankUpdated(worker, newRank);
    }

    function getRank(address worker) public view returns (uint256) {
        return rank[worker];
    }
}
