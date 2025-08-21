// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract PlanetaryBlessingBundle {
    struct NationBlessing {
        string nation;
        uint256 reliefAmount;
        string steward;
        string broadcastMessage;
        string usageCategory;
        uint256 amountUsed;
        string impactSummary;
        uint256 timestamp;
    }

    NationBlessing[] public blessings;

    event BlessingBundled(string nation, uint256 reliefAmount, string usageCategory, uint256 amountUsed, string impactSummary);

    function bundleBlessing(
        string memory nation,
        uint256 reliefAmount,
        string memory steward,
        string memory broadcastMessage,
        string memory usageCategory,
        uint256 amountUsed,
        string memory impactSummary
    ) public {
        blessings.push(NationBlessing(
            nation,
            reliefAmount,
            steward,
            broadcastMessage,
            usageCategory,
            amountUsed,
            impactSummary,
            block.timestamp
        ));

        emit BlessingBundled(nation, reliefAmount, usageCategory, amountUsed, impactSummary);
    }

    function getBlessings() public view returns (NationBlessing[] memory) {
        return blessings;
    }
}
