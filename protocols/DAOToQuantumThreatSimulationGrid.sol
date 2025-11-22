// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToQuantumThreatSimulationGrid {
    string public batchID = "1321.9.99";
    string public steward = "Vinvin";

    address public admin;

    struct Simulation {
        address validator;
        string attackType;
        bool passed;
        uint256 timestamp;
    }

    mapping(bytes32 => Simulation) public simulations;

    event SimulationRun(bytes32 indexed key, address indexed validator, string attackType, bool passed);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function runSimulation(address validator, string memory attackType, bool passed) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(validator, attackType, block.timestamp));
        simulations[key] = Simulation(validator, attackType, passed, block.timestamp);
        emit SimulationRun(key, validator, attackType, passed);
    }

    function getSimulation(bytes32 key) public view returns (address validator, string memory attackType, bool passed, uint256 timestamp) {
        Simulation memory s = simulations[key];
        return (s.validator, s.attackType, s.passed, s.timestamp);
    }
}
