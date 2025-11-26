// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToIntegrityBroadcastLedger {
    string public batchID = "1321.9.153";
    string public steward = "Vinvin";

    address public admin;

    struct IntegrityEvent {
        string caseDetail; // misconduct, reform, referral
        uint256 severity;
        uint256 timestamp;
        bool broadcasted;
    }

    IntegrityEvent[] public events;

    event IntegrityBroadcast(string caseDetail, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastIntegrity(string memory caseDetail, uint256 severity) public onlyAdmin {
        events.push(IntegrityEvent(caseDetail, severity, block.timestamp, true));
        emit IntegrityBroadcast(caseDetail, severity);
    }

    function getIntegrity(uint256 index) public view returns (string memory caseDetail, uint256 severity, uint256 timestamp, bool broadcasted) {
        IntegrityEvent memory e = events[index];
        return (e.caseDetail, e.severity, e.timestamp, e.broadcasted);
    }
}
