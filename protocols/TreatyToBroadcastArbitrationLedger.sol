// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToBroadcastArbitrationLedger {
    string public batchID = "1321.9.159";
    string public steward = "Vinvin";

    address public admin;

    struct ArbitrationEvent {
        string outcome;   // settlement, dismissal, ruling
        string forum;
        uint256 timestamp;
    }

    ArbitrationEvent[] public events;

    event ArbitrationBroadcast(string outcome, string forum);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastArbitration(string memory outcome, string memory forum) public onlyAdmin {
        events.push(ArbitrationEvent(outcome, forum, block.timestamp));
        emit ArbitrationBroadcast(outcome, forum);
    }

    function getArbitration(uint256 index) public view returns (string memory outcome, string memory forum, uint256 timestamp) {
        ArbitrationEvent memory e = events[index];
        return (e.outcome, e.forum, e.timestamp);
    }
}
