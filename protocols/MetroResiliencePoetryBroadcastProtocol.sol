// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MetroResiliencePoetryBroadcastProtocol {
    address public steward;

    struct Broadcast {
        string poemTitle;
        string author;
        string timestamp;
        string metroRegion;
        string emotionalTag;
    }

    Broadcast[] public broadcasts;

    event PoetryBroadcasted(string poemTitle, string author, string timestamp, string metroRegion, string emotionalTag);

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
        string memory metroRegion,
        string memory emotionalTag
    ) public onlySteward {
        broadcasts.push(Broadcast(poemTitle, author, timestamp, metroRegion, emotionalTag));
        emit PoetryBroadcasted(poemTitle, author, timestamp, metroRegion, emotionalTag);
    }
}
