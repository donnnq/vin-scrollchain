// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TradeResilienceSimulationGrid {
    address public admin;

    struct SimulationEntry {
        string country; // "Philippines"
        string exportSector; // "Electronics", "Agriculture"
        string shockScenario; // "US tariff spike", "Supply chain disruption"
        string resilienceScore; // "High", "Medium", "Low"
        string emotionalTag;
        bool simulated;
        bool sealed;
    }

    SimulationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function simulateResilience(string memory country, string memory exportSector, string memory shockScenario, string memory resilienceScore, string memory emotionalTag) external onlyAdmin {
        entries.push(SimulationEntry(country, exportSector, shockScenario, resilienceScore, emotionalTag, true, false));
    }

    function sealSimulationEntry(uint256 index) external onlyAdmin {
        require(entries[index].simulated, "Must be simulated first");
        entries[index].sealed = true;
    }

    function getSimulationEntry(uint256 index) external view returns (SimulationEntry memory) {
        return entries[index];
    }
}
