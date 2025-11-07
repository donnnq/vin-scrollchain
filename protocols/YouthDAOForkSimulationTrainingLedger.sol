// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthDAOForkSimulationTrainingLedger {
    address public steward;

    struct SimulationEntry {
        string name;
        string schoolOrBarangay;
        string timestamp;
        string forkScenario;
        string emotionalTag;
    }

    SimulationEntry[] public ledger;

    event YouthForkSimulationLogged(string name, string schoolOrBarangay, string timestamp, string forkScenario, string emotionalTag);

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
        string memory forkScenario,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(SimulationEntry(name, schoolOrBarangay, timestamp, forkScenario, emotionalTag));
        emit YouthForkSimulationLogged(name, schoolOrBarangay, timestamp, forkScenario, emotionalTag);
    }
}
