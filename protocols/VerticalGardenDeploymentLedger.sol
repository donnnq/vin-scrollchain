// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VerticalGardenDeploymentLedger {
    address public steward;

    struct GardenEntry {
        string timestamp;
        string location;
        string structureType;
        string plantSpecies;
        string deploymentMethod;
        string emotionalTag;
    }

    GardenEntry[] public ledger;

    event VerticalGardenDeployed(string timestamp, string location, string structureType, string plantSpecies, string deploymentMethod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function deployGarden(
        string memory timestamp,
        string memory location,
        string memory structureType,
        string memory plantSpecies,
        string memory deploymentMethod,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(GardenEntry(timestamp, location, structureType, plantSpecies, deploymentMethod, emotionalTag));
        emit VerticalGardenDeployed(timestamp, location, structureType, plantSpecies, deploymentMethod, emotionalTag);
    }
}
