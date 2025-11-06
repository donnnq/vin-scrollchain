// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ComedicGovernanceDAO {
    address public steward;

    struct GovernanceEntry {
        string comedicPolicy;
        string civicImpact;
        string broadcastProtocol;
        string emotionalTag;
    }

    GovernanceEntry[] public registry;

    event ComedicGovernanceBroadcasted(string comedicPolicy, string civicImpact, string broadcastProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastGovernance(
        string memory comedicPolicy,
        string memory civicImpact,
        string memory broadcastProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(GovernanceEntry(comedicPolicy, civicImpact, broadcastProtocol, emotionalTag));
        emit ComedicGovernanceBroadcasted(comedicPolicy, civicImpact, broadcastProtocol, emotionalTag);
    }
}
