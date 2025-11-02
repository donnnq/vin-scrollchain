// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CyberRestorationBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string corridor;
        string restorationTheme;
        string broadcastType;
        string emotionalTag;
    }

    BroadcastEntry[] public grid;

    event RestorationBroadcasted(string corridor, string restorationTheme, string broadcastType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastRestoration(
        string memory corridor,
        string memory restorationTheme,
        string memory broadcastType,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(BroadcastEntry(corridor, restorationTheme, broadcastType, emotionalTag));
        emit RestorationBroadcasted(corridor, restorationTheme, broadcastType, emotionalTag);
    }
}
