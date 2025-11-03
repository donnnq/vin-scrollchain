// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CombatSimulationCodex {
    address public steward;

    struct SimulationEntry {
        string simulationType;
        string ethicalScenario;
        string auditDirective;
        string emotionalTag;
    }

    SimulationEntry[] public codex;

    event CombatSimulationLogged(string simulationType, string ethicalScenario, string auditDirective, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logSimulation(
        string memory simulationType,
        string memory ethicalScenario,
        string memory auditDirective,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SimulationEntry(simulationType, ethicalScenario, auditDirective, emotionalTag));
        emit CombatSimulationLogged(simulationType, ethicalScenario, auditDirective, emotionalTag);
    }
}
