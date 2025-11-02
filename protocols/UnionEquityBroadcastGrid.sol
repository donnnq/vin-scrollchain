// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnionEquityBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string unionName;
        string corridor;
        string equityTheme;
        string emotionalTag;
    }

    BroadcastEntry[] public grid;

    event EquityBroadcasted(string unionName, string corridor, string equityTheme, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastEquity(
        string memory unionName,
        string memory corridor,
        string memory equityTheme,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(BroadcastEntry(unionName, corridor, equityTheme, emotionalTag));
        emit EquityBroadcasted(unionName, corridor, equityTheme, emotionalTag);
    }
}
