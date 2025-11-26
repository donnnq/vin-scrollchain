// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToRevivalBroadcastLedger {
    string public batchID = "1321.9.136";
    string public steward = "Vinvin";

    address public admin;

    struct RevivalEvent {
        string project;
        string action; // buyout, rescue, expansion
        uint256 impact;
        uint256 timestamp;
        bool broadcasted;
    }

    RevivalEvent[] public events;

    event RevivalBroadcast(string project, string action, uint256 impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastRevival(string memory project, string memory action, uint256 impact) public onlyAdmin {
        events.push(RevivalEvent(project, action, impact, block.timestamp, true));
        emit RevivalBroadcast(project, action, impact);
    }

    function getRevival(uint256 index) public view returns (string memory project, string memory action, uint256 impact, uint256 timestamp, bool broadcasted) {
        RevivalEvent memory r = events[index];
        return (r.project, r.action, r.impact, r.timestamp, r.broadcasted);
    }
}
