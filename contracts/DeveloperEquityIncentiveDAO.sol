// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeveloperEquityIncentiveDAO {
    address public admin;

    struct Developer {
        address wallet;
        bool verified;
        uint256 equityScore;
        uint256 rewardsClaimed;
    }

    mapping(address => Developer) public developers;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function verifyDeveloper(address _wallet) external onlyAdmin {
        developers[_wallet] = Developer(_wallet, true, 0, 0);
    }

    function updateEquityScore(address _wallet, uint256 _score) external onlyAdmin {
        require(developers[_wallet].verified, "Developer not verified");
        developers[_wallet].equityScore += _score;
    }

    function claimReward(address _wallet) external {
        require(developers[_wallet].verified, "Developer not verified");
        uint256 reward = developers[_wallet].equityScore * 0.05 ether;
        developers[_wallet].rewardsClaimed += reward;
        developers[_wallet].equityScore = 0;
        payable(_wallet).transfer(reward);
    }
}
