// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinSymbolicMeritTagger {
    enum MeritTier { Novice, DiplomaticEmber, AuraArtisan, KeeperOfScrolls }

    struct Merit {
        string name;
        MeritTier tier;
        uint timestamp;
    }

    Merit[] public meritList;
    event MeritAssigned(string name, MeritTier tier);

    function assignMerit(string memory name, MeritTier tier) public {
        meritList.push(Merit(name, tier, block.timestamp));
        emit MeritAssigned(name, tier);
    }

    function getAllMerits() public view returns (Merit[] memory) {
        return meritList;
    }
}
