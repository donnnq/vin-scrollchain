// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToOutbreakBroadcastLedger {
    string public batchID = "1321.9.146";
    string public steward = "Vinvin";

    address public admin;

    struct OutbreakEvent {
        string issue; // epidemic, shortage, migration
        uint256 impact;
        uint256 timestamp;
        bool broadcasted;
    }

    OutbreakEvent[] public events;

    event OutbreakBroadcast(string issue, uint256 impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastOutbreak(string memory issue, uint256 impact) public onlyAdmin {
        events.push(OutbreakEvent(issue, impact, block.timestamp, true));
        emit OutbreakBroadcast(issue, impact);
    }

    function getOutbreak(uint256 index) public view returns (string memory issue, uint256 impact, uint256 timestamp, bool broadcasted) {
        OutbreakEvent memory e = events[index];
        return (e.issue, e.impact, e.timestamp, e.broadcasted);
    }
}
