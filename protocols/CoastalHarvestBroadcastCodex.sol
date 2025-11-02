// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoastalHarvestBroadcastCodex {
    address public steward;

    struct HarvestClause {
        string location;
        string harvestType;
        string broadcastChannel;
        string emotionalTag;
    }

    HarvestClause[] public codex;

    event HarvestBroadcasted(string location, string harvestType, string broadcastChannel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastHarvest(
        string memory location,
        string memory harvestType,
        string memory broadcastChannel,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(HarvestClause(location, harvestType, broadcastChannel, emotionalTag));
        emit HarvestBroadcasted(location, harvestType, broadcastChannel, emotionalTag);
    }
}
