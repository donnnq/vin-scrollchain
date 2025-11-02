// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CitywideShowBroadcastCodex {
    address public steward;

    struct ShowClause {
        string city;
        string showType;
        string broadcastChannel;
        string emotionalTag;
    }

    ShowClause[] public codex;

    event ShowBroadcasted(string city, string showType, string broadcastChannel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastShow(
        string memory city,
        string memory showType,
        string memory broadcastChannel,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ShowClause(city, showType, broadcastChannel, emotionalTag));
        emit ShowBroadcasted(city, showType, broadcastChannel, emotionalTag);
    }
}
