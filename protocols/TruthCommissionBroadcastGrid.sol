// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthCommissionBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string commissionName;
        string corridor;
        string broadcastTheme;
        string emotionalTag;
    }

    BroadcastEntry[] public grid;

    event TruthBroadcasted(string commissionName, string corridor, string broadcastTheme, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastTruth(
        string memory commissionName,
        string memory corridor,
        string memory broadcastTheme,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(BroadcastEntry(commissionName, corridor, broadcastTheme, emotionalTag));
        emit TruthBroadcasted(commissionName, corridor, broadcastTheme, emotionalTag);
    }
}
