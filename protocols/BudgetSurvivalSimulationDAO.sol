// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BudgetSurvivalSimulationDAO {
    address public validator;

    struct Simulation {
        address worker;
        uint256 wage;
        uint256 expenses;
        bool survives;
        string notes;
        uint256 timestamp;
    }

    Simulation[] public simulations;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function runSimulation(address _worker, uint256 _wage, uint256 _expenses, string memory _notes) public onlyValidator {
        bool _survives = _wage >= _expenses;
        simulations.push(Simulation(_worker, _wage, _expenses, _survives, _notes, block.timestamp));
    }

    function getSimulation(uint256 index) public view returns (Simulation memory) {
        return simulations[index];
    }

    function totalSimulations() public view returns (uint256) {
        return simulations.length;
    }
}
