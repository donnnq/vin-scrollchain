// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ShelterImpactLeaderboard {
    struct ImpactEntry {
        string region;
        uint256 familiesRestored;
        uint256 blessingVolume;
        uint256 timestamp;
    }

    ImpactEntry[] public leaderboard;
    event ImpactLogged(string region, uint256 familiesRestored, uint256 blessingVolume, uint256 timestamp);

    function logImpact(string calldata region, uint256 familiesRestored, uint256 blessingVolume) external {
        leaderboard.push(ImpactEntry(region, familiesRestored, blessingVolume, block.timestamp));
        emit ImpactLogged(region, familiesRestored, blessingVolume, block.timestamp);
    }

    function getImpact(uint256 index) external view returns (ImpactEntry memory) {
        require(index < leaderboard.length, "Invalid index");
        return leaderboard[index];
    }

    function totalRegionsTracked() external view returns (uint256) {
        return leaderboard.length;
    }
}
