// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToEquityBroadcastLedger {
    string public batchID = "1321.9.151";
    string public steward = "Vinvin";

    address public admin;

    struct EquityEvent {
        string issue;   // inequity, reform, solidarity milestone
        string action;
        uint256 impact;
        uint256 timestamp;
        bool broadcasted;
    }

    EquityEvent[] public events;

    event EquityBroadcast(string issue, string action, uint256 impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastEquity(string memory issue, string memory action, uint256 impact) public onlyAdmin {
        events.push(EquityEvent(issue, action, impact, block.timestamp, true));
        emit EquityBroadcast(issue, action, impact);
    }

    function getEquity(uint256 index) public view returns (string memory issue, string memory action, uint256 impact, uint256 timestamp, bool broadcasted) {
        EquityEvent memory e = events[index];
        return (e.issue, e.action, e.impact, e.timestamp, e.broadcasted);
    }
}
