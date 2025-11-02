// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GreenCorridorBroadcastCodex {
    address public steward;

    struct BroadcastClause {
        string corridorName;
        string plantType;
        string broadcastMethod;
        string emotionalTag;
    }

    BroadcastClause[] public codex;

    event CorridorBroadcasted(string corridorName, string plantType, string broadcastMethod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastCorridor(
        string memory corridorName,
        string memory plantType,
        string memory broadcastMethod,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(BroadcastClause(corridorName, plantType, broadcastMethod, emotionalTag));
        emit CorridorBroadcasted(corridorName, plantType, broadcastMethod, emotionalTag);
    }
}
