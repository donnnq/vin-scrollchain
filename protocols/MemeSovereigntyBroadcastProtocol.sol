// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemeSovereigntyBroadcastProtocol {
    address public steward;

    struct MemeEntry {
        string memeName;
        string remixThreat;
        string sovereigntyProtocol;
        string emotionalTag;
    }

    MemeEntry[] public registry;

    event MemeSovereigntyBroadcasted(string memeName, string remixThreat, string sovereigntyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastMeme(
        string memory memeName,
        string memory remixThreat,
        string memory sovereigntyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(MemeEntry(memeName, remixThreat, sovereigntyProtocol, emotionalTag));
        emit MemeSovereigntyBroadcasted(memeName, remixThreat, sovereigntyProtocol, emotionalTag);
    }
}
