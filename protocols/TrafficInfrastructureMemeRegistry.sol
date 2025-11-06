// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TrafficInfrastructureMemeRegistry {
    address public steward;

    struct MemeEntry {
        string memeTitle;
        string infrastructureTarget;
        string civicMessage;
        string emotionalTag;
    }

    MemeEntry[] public registry;

    event MemeTagged(string memeTitle, string infrastructureTarget, string civicMessage, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagMeme(
        string memory memeTitle,
        string memory infrastructureTarget,
        string memory civicMessage,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(MemeEntry(memeTitle, infrastructureTarget, civicMessage, emotionalTag));
        emit MemeTagged(memeTitle, infrastructureTarget, civicMessage, emotionalTag);
    }
}
