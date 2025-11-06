// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExitStrategyMemeRegistry {
    address public steward;

    struct MemeEntry {
        string memePhrase;
        string context;
        string businessImpact;
        string emotionalTag;
    }

    MemeEntry[] public registry;

    event ExitMemeTagged(string memePhrase, string context, string businessImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagExitMeme(
        string memory memePhrase,
        string memory context,
        string memory businessImpact,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(MemeEntry(memePhrase, context, businessImpact, emotionalTag));
        emit ExitMemeTagged(memePhrase, context, businessImpact, emotionalTag);
    }
}
