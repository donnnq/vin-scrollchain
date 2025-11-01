// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainMemeSovereigntyDAO {
    address public steward;

    struct MemeEntry {
        string memeTitle;
        string corridor;
        string archetype;
        string emotionalTag;
    }

    MemeEntry[] public registry;

    event MemeTagged(string memeTitle, string corridor, string archetype, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagMeme(
        string memory memeTitle,
        string memory corridor,
        string memory archetype,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(MemeEntry(memeTitle, corridor, archetype, emotionalTag));
        emit MemeTagged(memeTitle, corridor, archetype, emotionalTag);
    }
}
