// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SnackEquityBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string snackType;
        string corridor;
        string equityTheme;
        string emotionalTag;
    }

    BroadcastEntry[] public grid;

    event SnackBroadcasted(string snackType, string corridor, string equityTheme, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastSnackEquity(
        string memory snackType,
        string memory corridor,
        string memory equityTheme,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(BroadcastEntry(snackType, corridor, equityTheme, emotionalTag));
        emit SnackBroadcasted(snackType, corridor, equityTheme, emotionalTag);
    }
}
