// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizationRiskBroadcastDAO {
    address public steward;

    struct RiskEntry {
        string riskSource;
        string networkImpact;
        string civicMessage;
        string emotionalTag;
    }

    RiskEntry[] public registry;

    event DecentralizationRiskBroadcasted(string riskSource, string networkImpact, string civicMessage, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastRisk(
        string memory riskSource,
        string memory networkImpact,
        string memory civicMessage,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RiskEntry(riskSource, networkImpact, civicMessage, emotionalTag));
        emit DecentralizationRiskBroadcasted(riskSource, networkImpact, civicMessage, emotionalTag);
    }
}
