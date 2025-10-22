// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICCArrestSimulationProtocol {
    address public admin;

    struct SimulationEntry {
        string targetName; // "Sen. Bato", "FPRRD"
        string scenarioType; // "ICC warrant", "International arrest"
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

    function simulateArrest(string memory targetName, string memory scenarioType, string memory emotionalTag) external onlyAdmin {
        entries.push(SimulationEntry(targetName, scenarioType, emotionalTag, true, false));
    }

    function sealSimulationEntry(uint256 index) external onlyAdmin {
        require(entries[index].simulated, "Must be simulated first");
        entries[index].sealed = true;
    }

    function getSimulationEntry(uint256 index) external view returns (SimulationEntry memory) {
        return entries[index];
    }
}
