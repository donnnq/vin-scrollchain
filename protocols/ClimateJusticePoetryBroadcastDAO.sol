// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateJusticePoetryBroadcastDAO {
    address public steward;

    struct Broadcast {
        string poemTitle;
        string author;
        string timestamp;
        string region;
        string emotionalTag;
    }

    Broadcast[] public broadcasts;

    event PoetryBroadcasted(string poemTitle, string author, string timestamp, string region, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastPoem(
        string memory poemTitle,
        string memory author,
        string memory timestamp,
        string memory region,
        string memory emotionalTag
    ) public onlySteward {
        broadcasts.push(Broadcast(poemTitle, author, timestamp, region, emotionalTag));
        emit PoetryBroadcasted(poemTitle, author, timestamp, region, emotionalTag);
    }
}
