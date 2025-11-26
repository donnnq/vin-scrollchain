// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToPanicBroadcastLedger {
    string public batchID = "1321.9.126";
    string public steward = "Vinvin";

    address public admin;

    struct PanicEvent {
        uint256 fearIndex;
        string trigger; // e.g. liquidation, ETF outflow
        uint256 timestamp;
        bool broadcasted;
    }

    PanicEvent[] public events;

    event PanicBroadcast(uint256 fearIndex, string trigger);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastPanic(uint256 fearIndex, string memory trigger) public onlyAdmin {
        events.push(PanicEvent(fearIndex, trigger, block.timestamp, true));
        emit PanicBroadcast(fearIndex, trigger);
    }

    function getPanic(uint256 index) public view returns (uint256 fearIndex, string memory trigger, uint256 timestamp, bool broadcasted) {
        PanicEvent memory e = events[index];
        return (e.fearIndex, e.trigger, e.timestamp, e.broadcasted);
    }
}
