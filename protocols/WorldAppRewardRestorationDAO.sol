// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorldAppRewardRestorationDAO {
    address public admin;

    struct RewardEntry {
        string userRegion;
        string rewardType;
        string restorationStatus;
        string emotionalTag;
        bool summoned;
        bool restored;
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

    function summonRestoration(string memory userRegion, string memory rewardType, string memory restorationStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(RewardEntry(userRegion, rewardType, restorationStatus, emotionalTag, true, false, false));
    }

    function confirmRestoration(uint256 index) external onlyAdmin {
        entries[index].restored = true;
    }

    function sealRewardEntry(uint256 index) external onlyAdmin {
        require(entries[index].restored, "Must be restored first");
        entries[index].sealed = true;
    }

    function getRewardEntry(uint256 index) external view returns (RewardEntry memory) {
        return entries[index];
    }
}
