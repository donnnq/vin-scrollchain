// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToThreatGrid {
    string public batchID = "1321.9.174";
    string public steward = "Vinvin";

    address public admin;

    struct Threat {
        string typeOfThreat; // malware, phishing, supply chain attack
        string vector;       // email, npm package, network
        uint256 severity;    // scale 1-10
        uint256 timestamp;
    }

    Threat[] public threats;

    event ThreatLogged(string typeOfThreat, string vector, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logThreat(string memory typeOfThreat, string memory vector, uint256 severity) public onlyAdmin {
        threats.push(Threat(typeOfThreat, vector, severity, block.timestamp));
        emit ThreatLogged(typeOfThreat, vector, severity);
    }

    function getThreat(uint256 index) public view returns (string memory typeOfThreat, string memory vector, uint256 severity, uint256 timestamp) {
        Threat memory t = threats[index];
        return (t.typeOfThreat, t.vector, t.severity, t.timestamp);
    }
}
