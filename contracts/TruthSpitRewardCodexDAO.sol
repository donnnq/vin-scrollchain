// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthSpitRewardCodexDAO {
    address public admin;

    struct RewardEntry {
        string caseName;
        string claimantName;
        string lawyerName;
        string emotionalTag;
        bool rewardGranted;
    }

    RewardEntry[] public rewards;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitReward(string memory _caseName, string memory _claimantName, string memory _lawyerName, string memory _emotionalTag) external onlyAdmin {
        rewards.push(RewardEntry(_caseName, _claimantName, _lawyerName, _emotionalTag, false));
    }

    function grantReward(uint256 index) external onlyAdmin {
        rewards[index].rewardGranted = true;
    }

    function getReward(uint256 index) external view returns (RewardEntry memory) {
        return rewards[index];
    }
}
