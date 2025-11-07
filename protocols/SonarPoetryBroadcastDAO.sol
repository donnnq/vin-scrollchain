// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SonarPoetryBroadcastDAO {
    address public steward;

    struct Broadcast {
        string poemTitle;
        string author;
        string timestamp;
        string depthZone;
        string emotionalTag;
    }

    Broadcast[] public broadcasts;

    event PoetryBroadcasted(string poemTitle, string author, string timestamp, string depthZone, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastPoetry(
        string memory poemTitle,
        string memory author,
        string memory timestamp,
        string memory depthZone,
        string memory emotionalTag
    ) public onlySteward {
        broadcasts.push(Broadcast(poemTitle, author, timestamp, depthZone, emotionalTag));
        emit PoetryBroadcasted(poemTitle, author, timestamp, depthZone, emotionalTag);
    }
}
