// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanFloodSimulationTrainingManifest {
    address public steward;

    struct SimulationEntry {
        string barangay;
        string timestamp;
        string simulationType;
        string participationLevel;
        string emotionalTag;
    }

    SimulationEntry[] public manifest;

    event FloodSimulationConducted(string barangay, string timestamp, string simulationType, string participationLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function conductSimulation(
        string memory barangay,
        string memory timestamp,
        string memory simulationType,
        string memory participationLevel,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(SimulationEntry(barangay, timestamp, simulationType, participationLevel, emotionalTag));
        emit FloodSimulationConducted(barangay, timestamp, simulationType, participationLevel, emotionalTag);
    }
}
