// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemeSovereigntyBroadcast {
    address public steward;

    struct MemeDrop {
        string title;
        string creator;
        string archetype;
        string emotionalTag;
        uint256 timestamp;
    }

    MemeDrop[] public broadcastLog;

    event MemeBroadcasted(string title, string creator, string archetype, string emotionalTag, uint256 timestamp);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastMeme(
        string memory title,
        string memory creator,
        string memory archetype,
        string memory emotionalTag
    ) public onlySteward {
        broadcastLog.push(MemeDrop(title, creator, archetype, emotionalTag, block.timestamp));
        emit MemeBroadcasted(title, creator, archetype, emotionalTag, block.timestamp);
    }
}
