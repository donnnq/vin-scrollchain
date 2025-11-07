// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisasterMemoryHealingPoetryDAO {
    address public steward;

    struct HealingPoem {
        string poemTitle;
        string author;
        string timestamp;
        string disasterReference;
        string emotionalTag;
    }

    HealingPoem[] public registry;

    event HealingPoetryBroadcasted(string poemTitle, string author, string timestamp, string disasterReference, string emotionalTag);

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
        string memory disasterReference,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(HealingPoem(poemTitle, author, timestamp, disasterReference, emotionalTag));
        emit HealingPoetryBroadcasted(poemTitle, author, timestamp, disasterReference, emotionalTag);
    }
}
