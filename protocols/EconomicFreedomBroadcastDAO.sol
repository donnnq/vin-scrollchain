// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EconomicFreedomBroadcastDAO {
    address public steward;

    struct FreedomEntry {
        string stateName;
        string freedomScore;
        string policyHighlight;
        string emotionalTag;
    }

    FreedomEntry[] public registry;

    event EconomicFreedomBroadcasted(string stateName, string freedomScore, string policyHighlight, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastFreedom(
        string memory stateName,
        string memory freedomScore,
        string memory policyHighlight,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(FreedomEntry(stateName, freedomScore, policyHighlight, emotionalTag));
        emit EconomicFreedomBroadcasted(stateName, freedomScore, policyHighlight, emotionalTag);
    }
}
