// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BridgeCompletionBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string bridgeName;
        string corridor;
        string completionStatus;
        string emotionalTag;
    }

    BroadcastEntry[] public grid;

    event CompletionBroadcasted(string bridgeName, string corridor, string completionStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastCompletion(
        string memory bridgeName,
        string memory corridor,
        string memory completionStatus,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(BroadcastEntry(bridgeName, corridor, completionStatus, emotionalTag));
        emit CompletionBroadcasted(bridgeName, corridor, completionStatus, emotionalTag);
    }
}
