// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegionalRewardDAO {
    address public admin;

    struct RewardEntry {
        string region;
        string rewardType;
        string distributionMethod;
        string emotionalTag;
        bool summoned;
        bool deployed;
        bool sealed;
    }

    RewardEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReward(string memory region, string memory rewardType, string memory distributionMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(RewardEntry(region, rewardType, distributionMethod, emotionalTag, true, false, false));
    }

    function confirmDeployment(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealRewardEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getRewardEntry(uint256 index) external view returns (RewardEntry memory) {
        return entries[index];
    }
}
