// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToCorruptionBroadcastLedger {
    string public batchID = "1321.9.142";
    string public steward = "Vinvin";

    address public admin;

    struct CorruptionEvent {
        string caseName;
        string action; // misuse, suspension, reform
        uint256 severity;
        uint256 timestamp;
        bool broadcasted;
    }

    CorruptionEvent[] public events;

    event CorruptionBroadcast(string caseName, string action, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastCorruption(string memory caseName, string memory action, uint256 severity) public onlyAdmin {
        events.push(CorruptionEvent(caseName, action, severity, block.timestamp, true));
        emit CorruptionBroadcast(caseName, action, severity);
    }

    function getCorruption(uint256 index) public view returns (string memory caseName, string memory action, uint256 severity, uint256 timestamp, bool broadcasted) {
        CorruptionEvent memory e = events[index];
        return (e.caseName, e.action, e.severity, e.timestamp, e.broadcasted);
    }
}
