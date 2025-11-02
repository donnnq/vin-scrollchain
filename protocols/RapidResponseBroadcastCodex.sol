// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RapidResponseBroadcastCodex {
    address public steward;

    struct ResponseClause {
        string location;
        string alertType;
        string broadcastChannel;
        string emotionalTag;
    }

    ResponseClause[] public codex;

    event ResponseBroadcasted(string location, string alertType, string broadcastChannel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastResponse(
        string memory location,
        string memory alertType,
        string memory broadcastChannel,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ResponseClause(location, alertType, broadcastChannel, emotionalTag));
        emit ResponseBroadcasted(location, alertType, broadcastChannel, emotionalTag);
    }
}
