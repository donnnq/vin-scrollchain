// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToPublicConfidenceGrid {
    string public batchID = "1321.9.181";
    string public steward = "Vinvin";

    address public admin;

    struct ConfidenceEvent {
        string sector;      // governance, health, education
        string measure;     // transparency, outreach, reform
        uint256 timestamp;
    }

    ConfidenceEvent[] public events;

    event ConfidenceLogged(string sector, string measure);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logConfidence(string memory sector, string memory measure) public onlyAdmin {
        events.push(ConfidenceEvent(sector, measure, block.timestamp));
        emit ConfidenceLogged(sector, measure);
    }

    function getConfidence(uint256 index) public view returns (string memory sector, string memory measure, uint256 timestamp) {
        ConfidenceEvent memory e = events[index];
        return (e.sector, e.measure, e.timestamp);
    }
}
