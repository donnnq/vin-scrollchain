// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityTrustBreachDAO {
    address public steward;

    struct BreachEntry {
        string communityName;
        string breachType;
        string civicImpact;
        string emotionalTag;
    }

    BreachEntry[] public registry;

    event TrustBreachBroadcasted(string communityName, string breachType, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastBreach(
        string memory communityName,
        string memory breachType,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BreachEntry(communityName, breachType, civicImpact, emotionalTag));
        emit TrustBreachBroadcasted(communityName, breachType, civicImpact, emotionalTag);
    }
}
