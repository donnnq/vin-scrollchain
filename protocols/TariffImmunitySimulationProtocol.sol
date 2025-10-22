// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TariffImmunitySimulationProtocol {
    address public admin;

    struct SimulationEntry {
        string country; // "Philippines"
        string sector; // "Electronics", "Agriculture"
        string immunityMechanism; // "FTA buffer", "ASEAN leverage"
        string simulationOutcome; // "Shielded", "Partially exposed", "Vulnerable"
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

    function simulateImmunity(string memory country, string memory sector, string memory immunityMechanism, string memory simulationOutcome, string memory emotionalTag) external onlyAdmin {
        entries.push(SimulationEntry(country, sector, immunityMechanism, simulationOutcome, emotionalTag, true, false));
    }

    function sealSimulationEntry(uint256 index) external onlyAdmin {
        require(entries[index].simulated, "Must be simulated first");
        entries[index].sealed = true;
    }

    function getSimulationEntry(uint256 index) external view returns (SimulationEntry memory) {
        return entries[index];
    }
}
