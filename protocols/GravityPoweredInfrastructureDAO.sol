// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GravityPoweredInfrastructureDAO {
    address public steward;

    struct InfrastructureEntry {
        string projectName;
        string gravityMechanism;
        string civicImpact;
        string emotionalTag;
    }

    InfrastructureEntry[] public registry;

    event GravityInfrastructureBroadcasted(string projectName, string gravityMechanism, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastInfrastructure(
        string memory projectName,
        string memory gravityMechanism,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(InfrastructureEntry(projectName, gravityMechanism, civicImpact, emotionalTag));
        emit GravityInfrastructureBroadcasted(projectName, gravityMechanism, civicImpact, emotionalTag);
    }
}
