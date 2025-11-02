// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CableSafetyBroadcastCodex {
    address public steward;

    struct SafetyClause {
        string location;
        string safetyProtocol;
        string broadcastMedium;
        string emotionalTag;
    }

    SafetyClause[] public codex;

    event SafetyBroadcasted(string location, string safetyProtocol, string broadcastMedium, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastSafety(
        string memory location,
        string memory safetyProtocol,
        string memory broadcastMedium,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SafetyClause(location, safetyProtocol, broadcastMedium, emotionalTag));
        emit SafetyBroadcasted(location, safetyProtocol, broadcastMedium, emotionalTag);
    }
}
