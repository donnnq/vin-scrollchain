// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetSimulationProtocol {
    address public admin;

    struct SimulationEntry {
        string region;
        string simulationType;
        string emotionalTag;
        bool summoned;
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

    function summonSimulation(string memory region, string memory simulationType, string memory emotionalTag) external onlyAdmin {
        entries.push(SimulationEntry(region, simulationType, emotionalTag, true, false, false));
    }

    function confirmSimulation(uint256 index) external onlyAdmin {
        entries[index].simulated = true;
    }

    function sealSimulationEntry(uint256 index) external onlyAdmin {
        require(entries[index].simulated, "Must be simulated first");
        entries[index].sealed = true;
    }

    function getSimulationEntry(uint256 index) external view returns (SimulationEntry memory) {
        return entries[index];
    }
}
