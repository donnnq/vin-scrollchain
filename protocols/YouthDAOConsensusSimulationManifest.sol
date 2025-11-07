// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthDAOConsensusSimulationManifest {
    address public steward;

    struct SimulationEntry {
        string name;
        string schoolOrBarangay;
        string timestamp;
        string consensusScenario;
        string emotionalTag;
    }

    SimulationEntry[] public manifest;

    event YouthConsensusSimulationLogged(string name, string schoolOrBarangay, string timestamp, string consensusScenario, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logSimulation(
        string memory name,
        string memory schoolOrBarangay,
        string memory timestamp,
        string memory consensusScenario,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(SimulationEntry(name, schoolOrBarangay, timestamp, consensusScenario, emotionalTag));
        emit YouthConsensusSimulationLogged(name, schoolOrBarangay, timestamp, consensusScenario, emotionalTag);
    }
}
