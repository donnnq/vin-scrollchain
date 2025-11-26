// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToCommunityBroadcastLedger {
    string public batchID = "HIV-Resilience-001";
    string public steward = "Vinvin";

    address public admin;

    struct CommunityEvent {
        string program;   // grassroots HIV prevention, vulnerable groups
        string action;    // milestone, reform, empowerment
        uint256 impact;
        uint256 timestamp;
        bool broadcasted;
    }

    CommunityEvent[] public events;

    event CommunityBroadcast(string program, string action, uint256 impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastCommunity(string memory program, string memory action, uint256 impact) public onlyAdmin {
        events.push(CommunityEvent(program, action, impact, block.timestamp, true));
        emit CommunityBroadcast(program, action, impact);
    }

    function getCommunity(uint256 index) public view returns (string memory program, string memory action, uint256 impact, uint256 timestamp, bool broadcasted) {
        CommunityEvent memory e = events[index];
        return (e.program, e.action, e.impact, e.timestamp, e.broadcasted);
    }
}
