// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LaborCorridorBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string corridor;
        string laborTheme;
        string broadcastType;
        string emotionalTag;
    }

    BroadcastEntry[] public grid;

    event LaborBroadcasted(string corridor, string laborTheme, string broadcastType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastLabor(
        string memory corridor,
        string memory laborTheme,
        string memory broadcastType,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(BroadcastEntry(corridor, laborTheme, broadcastType, emotionalTag));
        emit LaborBroadcasted(corridor, laborTheme, broadcastType, emotionalTag);
    }
}
