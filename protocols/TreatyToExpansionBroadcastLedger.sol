// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToExpansionBroadcastLedger {
    string public batchID = "1321.9.137";
    string public steward = "Vinvin";

    address public admin;

    struct ExpansionEvent {
        string site;
        string action; // launch, milestone, shock
        uint256 impact;
        uint256 timestamp;
        bool broadcasted;
    }

    ExpansionEvent[] public events;

    event ExpansionBroadcast(string site, string action, uint256 impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastExpansion(string memory site, string memory action, uint256 impact) public onlyAdmin {
        events.push(ExpansionEvent(site, action, impact, block.timestamp, true));
        emit ExpansionBroadcast(site, action, impact);
    }

    function getExpansion(uint256 index) public view returns (string memory site, string memory action, uint256 impact, uint256 timestamp, bool broadcasted) {
        ExpansionEvent memory e = events[index];
        return (e.site, e.action, e.impact, e.timestamp, e.broadcasted);
    }
}
