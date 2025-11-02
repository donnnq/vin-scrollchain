// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AltcoinSeasonIndexBroadcastGrid {
    address public steward;

    struct IndexBroadcast {
        uint256 indexValue;
        string corridor;
        string broadcastType;
        string emotionalTag;
    }

    IndexBroadcast[] public grid;

    event IndexBroadcasted(uint256 indexValue, string corridor, string broadcastType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastIndex(
        uint256 indexValue,
        string memory corridor,
        string memory broadcastType,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(IndexBroadcast(indexValue, corridor, broadcastType, emotionalTag));
        emit IndexBroadcasted(indexValue, corridor, broadcastType, emotionalTag);
    }
}
