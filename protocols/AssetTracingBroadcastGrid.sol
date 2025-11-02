// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssetTracingBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string assetName;
        string corridor;
        string tracingMethod;
        string emotionalTag;
    }

    BroadcastEntry[] public grid;

    event AssetBroadcasted(string assetName, string corridor, string tracingMethod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastAsset(
        string memory assetName,
        string memory corridor,
        string memory tracingMethod,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(BroadcastEntry(assetName, corridor, tracingMethod, emotionalTag));
        emit AssetBroadcasted(assetName, corridor, tracingMethod, emotionalTag);
    }
}
