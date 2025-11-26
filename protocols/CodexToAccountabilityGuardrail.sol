// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToCorruptionBroadcastLedger {
    string public batchID = "1321.9.152";
    string public steward = "Vinvin";

    address public admin;

    struct CorruptionEvent {
        string official;   // House Rep, VP, Mayor, Governor
        string caseDetail; // referral, investigation, Ombudsman case
        uint256 severity;
        uint256 timestamp;
        bool broadcasted;
    }

    CorruptionEvent[] public events;

    event CorruptionBroadcast(string official, string caseDetail, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastCorruption(string memory official, string memory caseDetail, uint256 severity) public onlyAdmin {
        events.push(CorruptionEvent(official, caseDetail, severity, block.timestamp, true));
        emit CorruptionBroadcast(official, caseDetail, severity);
    }

    function getCorruption(uint256 index) public view returns (string memory official, string memory caseDetail, uint256 severity, uint256 timestamp, bool broadcasted) {
        CorruptionEvent memory e = events[index];
        return (e.official, e.caseDetail, e.severity, e.timestamp, e.broadcasted);
    }
}
