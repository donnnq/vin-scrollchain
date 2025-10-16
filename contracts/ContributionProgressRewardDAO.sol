// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContributionProgressRewardDAO {
    address public admin;

    struct ProgressEntry {
        string devName;
        string projectTitle;
        uint8 progressPercent; // 0, 25, 50, 75, 100
        uint256 rewardAmount;
        string emotionalTag;
        bool rewarded;
    }

    ProgressEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logProgress(string memory devName, string memory projectTitle, uint8 progressPercent, uint256 rewardAmount, string memory emotionalTag) external onlyAdmin {
        entries.push(ProgressEntry(devName, projectTitle, progressPercent, rewardAmount, emotionalTag, false));
    }

    function markRewarded(uint256 index) external onlyAdmin {
        entries[index].rewarded = true;
    }

    function getProgress(uint256 index) external view returns (ProgressEntry memory) {
        return entries[index];
    }
}
