// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoolingInfrastructureDAO {
    address public steward;

    struct CoolingEntry {
        string projectName;
        string infrastructureType;
        string implementationZone;
        string emotionalTag;
    }

    CoolingEntry[] public registry;

    event CoolingInfrastructureBroadcasted(string projectName, string infrastructureType, string implementationZone, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastCooling(
        string memory projectName,
        string memory infrastructureType,
        string memory implementationZone,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(CoolingEntry(projectName, infrastructureType, implementationZone, emotionalTag));
        emit CoolingInfrastructureBroadcasted(projectName, infrastructureType, implementationZone, emotionalTag);
    }
}
