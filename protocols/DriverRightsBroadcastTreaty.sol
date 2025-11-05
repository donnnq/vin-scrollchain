// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DriverRightsBroadcastTreaty {
    address public steward;

    struct BroadcastClause {
        string region;
        string rightsProtocol;
        string broadcastChannel;
        string emotionalTag;
    }

    BroadcastClause[] public treatyLog;

    event DriverRightsBroadcasted(string region, string rightsProtocol, string broadcastChannel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastRights(
        string memory region,
        string memory rightsProtocol,
        string memory broadcastChannel,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(BroadcastClause(region, rightsProtocol, broadcastChannel, emotionalTag));
        emit DriverRightsBroadcasted(region, rightsProtocol, broadcastChannel, emotionalTag);
    }
}
