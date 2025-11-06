// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EconomicRevolutionBroadcastDAO {
    address public steward;

    struct BroadcastEntry {
        string campaignName;
        string revolutionPillar;
        string broadcastProtocol;
        string emotionalTag;
    }

    BroadcastEntry[] public registry;

    event EconomicRevolutionBroadcasted(string campaignName, string revolutionPillar, string broadcastProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastRevolution(
        string memory campaignName,
        string memory revolutionPillar,
        string memory broadcastProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BroadcastEntry(campaignName, revolutionPillar, broadcastProtocol, emotionalTag));
        emit EconomicRevolutionBroadcasted(campaignName, revolutionPillar, broadcastProtocol, emotionalTag);
    }
}
