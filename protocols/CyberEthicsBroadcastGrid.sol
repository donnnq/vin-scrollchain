// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CyberEthicsBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string corridor;
        string ethicsTheme;
        string broadcastType;
        string emotionalTag;
    }

    BroadcastEntry[] public grid;

    event EthicsBroadcasted(string corridor, string ethicsTheme, string broadcastType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastEthics(
        string memory corridor,
        string memory ethicsTheme,
        string memory broadcastType,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(BroadcastEntry(corridor, ethicsTheme, broadcastType, emotionalTag));
        emit EthicsBroadcasted(corridor, ethicsTheme, broadcastType, emotionalTag);
    }
}
