// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title RestartLeaderboard
/// @author Vinvin
/// @notice Honors families who rise from displacement with soulbound dignity
contract RestartLeaderboard {
    struct RestartEntry {
        string familyName;
        string region;
        uint256 blessingScore;
        uint256 timestamp;
    }

    RestartEntry[] public leaderboard;
    event FamilyRestarted(string familyName, string region, uint256 blessingScore, uint256 timestamp);

    function logRestart(string calldata familyName, string calldata region, uint256 blessingScore) external {
        RestartEntry memory entry = RestartEntry(familyName, region, blessingScore, block.timestamp);
        leaderboard.push(entry);
        emit FamilyRestarted(familyName, region, blessingScore, block.timestamp);
    }

    function getTopFamilies(uint256 count) external view returns (RestartEntry[] memory) {
        require(count <= leaderboard.length, "Not enough entries");
        RestartEntry[] memory top = new RestartEntry[](count);
        for (uint256 i = 0; i < count; i++) {
            top[i] = leaderboard[i];
        }
        return top;
    }

    function totalFamiliesLogged() external view returns (uint256) {
        return leaderboard.length;
    }
}
