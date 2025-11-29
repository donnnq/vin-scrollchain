// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToAntiBrutalitySafeguardsGrid {
    string public batchID = "1321.9.195";
    string public steward = "Vinvin";

    address public admin;

    struct Safeguard {
        string incident;    // arrest, protest, detention
        string measure;     // bodycam, audit, civilian oversight
        uint256 timestamp;
    }

    Safeguard[] public safeguards;

    event SafeguardLogged(string incident, string measure);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSafeguard(string memory incident, string memory measure) public onlyAdmin {
        safeguards.push(Safeguard(incident, measure, block.timestamp));
        emit SafeguardLogged(incident, measure);
    }

    function getSafeguard(uint256 index) public view returns (string memory incident, string memory measure, uint256 timestamp) {
        Safeguard memory s = safeguards[index];
        return (s.incident, s.measure, s.timestamp);
    }
}
