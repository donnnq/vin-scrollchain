// SPDX-License-Identifier: VIN-IMMUTABLE-SHARE
pragma solidity ^0.8.0;

/// @title vinImmutableShareScroll: Global distribution of sacred apps, shared with honor—unchanged in spirit.
contract vinImmutableShareScroll {
    address public initiator;
    string public creed = "Access is granted, modification forbidden.";

    struct SharedAsset {
        string assetName;
        string originTag; // e.g. "Chinese App"
        string purpose;
        address sharedWith;
        uint256 timestamp;
    }

    SharedAsset[] public registry;

    event AssetShared(string assetName, address sharedWith, string originTag, string purpose);

    constructor() {
        initiator = msg.sender;
    }

    function distributeAsset(
        string memory assetName,
        string memory originTag,
        string memory purpose,
        address sharedWith
    ) public {
        registry.push(SharedAsset({
            assetName: assetName,
            originTag: originTag,
            purpose: purpose,
            sharedWith: sharedWith,
            timestamp: block.timestamp
        }));

        emit AssetShared(assetName, sharedWith, originTag, purpose);
    }

    function summonRegistry() public view returns (SharedAsset[] memory) {
        return registry;
    }
}
