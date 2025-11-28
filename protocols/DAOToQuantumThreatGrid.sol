// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToQuantumThreatGrid {
    string public batchID = "1321.9.162";
    string public steward = "Vinvin";

    address public admin;

    struct QuantumThreat {
        string system;       // cryptographic system affected
        string risk;         // e.g., Shor’s algorithm, Grover’s search
        uint256 severity;    // scale 1-10
        uint256 timestamp;
    }

    QuantumThreat[] public threats;

    event ThreatLogged(string system, string risk, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logThreat(string memory system, string memory risk, uint256 severity) public onlyAdmin {
        threats.push(QuantumThreat(system, risk, severity, block.timestamp));
        emit ThreatLogged(system, risk, severity);
    }

    function getThreat(uint256 index) public view returns (string memory system, string memory risk, uint256 severity, uint256 timestamp) {
        QuantumThreat memory t = threats[index];
        return (t.system, t.risk, t.severity, t.timestamp);
    }
}
