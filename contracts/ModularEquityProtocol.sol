// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModularEquityProtocol {
    address public admin;

    struct Developer {
        bool verified;
        uint256 rewardBalance;
    }

    mapping(address => Developer) public developers;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function verifyDeveloper(address _dev) external onlyAdmin {
        developers[_dev] = Developer(true, 0);
    }

    function submitModularBuild(address _dev, uint256 units, uint256 avgCost) external onlyAdmin {
        require(developers[_dev].verified, "Developer not verified");
        if (avgCost < 200000) {
            developers[_dev].rewardBalance += units * 0.1 ether;
        }
    }

    function claimReward(address _dev) external {
        uint256 reward = developers[_dev].rewardBalance;
        developers[_dev].rewardBalance = 0;
        payable(_dev).transfer(reward);
    }
}
