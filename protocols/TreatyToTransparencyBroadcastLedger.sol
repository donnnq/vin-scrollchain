// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToTransparencyBroadcastLedger {
    string public batchID = "1321.9.143";
    string public steward = "Vinvin";

    address public admin;

    struct TransparencyEvent {
        string reform;
        string action; // suspension, directive, audit
        uint256 impact;
        uint256 timestamp;
        bool broadcasted;
    }

    TransparencyEvent[] public events;

    event TransparencyBroadcast(string reform, string action, uint256 impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastTransparency(string memory reform, string memory action, uint256 impact) public onlyAdmin {
        events.push(TransparencyEvent(reform, action, impact, block.timestamp, true));
        emit TransparencyBroadcast(reform, action, impact);
    }

    function getTransparency(uint256 index) public view returns (string memory reform, string memory action, uint256 impact, uint256 timestamp, bool broadcasted) {
        TransparencyEvent memory e = events[index];
        return (e.reform, e.action, e.impact, e.timestamp, e.broadcasted);
    }
}
