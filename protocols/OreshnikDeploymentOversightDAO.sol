// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OreshnikDeploymentOversightDAO {
    address public steward;

    struct OversightEntry {
        string missileType;
        string deploymentRegion;
        string oversightSignal;
        string emotionalTag;
    }

    OversightEntry[] public registry;

    event OreshnikDeploymentTagged(string missileType, string deploymentRegion, string oversightSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDeployment(
        string memory missileType,
        string memory deploymentRegion,
        string memory oversightSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(OversightEntry(missileType, deploymentRegion, oversightSignal, emotionalTag));
        emit OreshnikDeploymentTagged(missileType, deploymentRegion, oversightSignal, emotionalTag);
    }
}
