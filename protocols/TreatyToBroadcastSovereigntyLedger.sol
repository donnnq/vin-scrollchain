// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToBroadcastSovereigntyLedger {
    string public batchID = "1321.9.160";
    string public steward = "Vinvin";

    address public admin;

    struct SovereigntyEvent {
        string jurisdiction;
        string ruling;    // upheld, violated, pending
        uint256 timestamp;
    }

    SovereigntyEvent[] public events;

    event SovereigntyBroadcast(string jurisdiction, string ruling);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastEvent(string memory jurisdiction, string memory ruling) public onlyAdmin {
        events.push(SovereigntyEvent(jurisdiction, ruling, block.timestamp));
        emit SovereigntyBroadcast(jurisdiction, ruling);
    }

    function getEvent(uint256 index) public view returns (string memory jurisdiction, string memory ruling, uint256 timestamp) {
        SovereigntyEvent memory e = events[index];
        return (e.jurisdiction, e.ruling, e.timestamp);
    }
}
