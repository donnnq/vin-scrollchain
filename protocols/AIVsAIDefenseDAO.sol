// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AIVsAIDefenseDAO {
    address public validator;
    bool public paused;

    event DefenderRegistered(address agent, string role, uint256 timestamp);
    event IncidentDetected(string vector, string severity, uint256 timestamp);
    event MitigationExecuted(string action, string outcome, uint256 timestamp);
    event Paused(bool state, uint256 timestamp);

    struct Defender {
        bool active;
        string role; // detector, responder, auditor
    }

    mapping(address => Defender) public defenders;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    modifier notPaused() {
        require(!paused, "Paused");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function setPaused(bool _paused) external onlyValidator {
        paused = _paused;
        emit Paused(_paused, block.timestamp);
    }

    function registerDefender(address agent, string memory role) external onlyValidator {
        defenders[agent] = Defender(true, role);
        emit DefenderRegistered(agent, role, block.timestamp);
    }

    function disableDefender(address agent) external onlyValidator {
        defenders[agent].active = false;
    }

    function detectIncident(string memory vector, string memory severity) external notPaused {
        require(defenders[msg.sender].active, "Defender inactive");
        emit IncidentDetected(vector, severity, block.timestamp);
    }

    function executeMitigation(string memory action, string memory outcome) external notPaused {
        require(defenders[msg.sender].active, "Defender inactive");
        emit MitigationExecuted(action, outcome, block.timestamp);
    }
}
