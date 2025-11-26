// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToTransitBroadcastLedger {
    string public batchID = "1321.9.145";
    string public steward = "Vinvin";

    address public admin;

    struct TransitEvent {
        string reform;
        string action; // congestion, milestone, reform
        uint256 impact;
        uint256 timestamp;
        bool broadcasted;
    }

    TransitEvent[] public events;

    event TransitBroadcast(string reform, string action, uint256 impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastTransit(string memory reform, string memory action, uint256 impact) public onlyAdmin {
        events.push(TransitEvent(reform, action, impact, block.timestamp, true));
        emit TransitBroadcast(reform, action, impact);
    }

    function getTransit(uint256 index) public view returns (string memory reform, string memory action, uint256 impact, uint256 timestamp, bool broadcasted) {
        TransitEvent memory e = events[index];
        return (e.reform, e.action, e.impact, e.timestamp, e.broadcasted);
    }
}
