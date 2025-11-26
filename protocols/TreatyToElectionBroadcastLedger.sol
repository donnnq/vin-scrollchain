// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToElectionBroadcastLedger {
    string public batchID = "1321.9.154";
    string public steward = "Vinvin";

    address public admin;

    struct ElectionEvent {
        string detail;   // anomaly, reform, milestone
        uint256 severity;
        uint256 timestamp;
        bool broadcasted;
    }

    ElectionEvent[] public events;

    event ElectionBroadcast(string detail, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastElection(string memory detail, uint256 severity) public onlyAdmin {
        events.push(ElectionEvent(detail, severity, block.timestamp, true));
        emit ElectionBroadcast(detail, severity);
    }

    function getElection(uint256 index) public view returns (string memory detail, uint256 severity, uint256 timestamp, bool broadcasted) {
        ElectionEvent memory e = events[index];
        return (e.detail, e.severity, e.timestamp, e.broadcasted);
    }
}
