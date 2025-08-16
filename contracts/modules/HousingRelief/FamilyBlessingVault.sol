// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FamilyBlessingVault {
    struct Blessing {
        string familyName;
        string region;
        string rebirthMessage;
        uint256 timestamp;
    }

    Blessing[] public vault;
    event BlessingArchived(string familyName, string region, string rebirthMessage, uint256 timestamp);

    function archiveBlessing(string calldata familyName, string calldata region, string calldata rebirthMessage) external {
        vault.push(Blessing(familyName, region, rebirthMessage, block.timestamp));
        emit BlessingArchived(familyName, region, rebirthMessage, block.timestamp);
    }

    function getBlessing(uint256 index) external view returns (Blessing memory) {
        require(index < vault.length, "Invalid index");
        return vault[index];
    }

    function totalBlessings() external view returns (uint256) {
        return vault.length;
    }
}
