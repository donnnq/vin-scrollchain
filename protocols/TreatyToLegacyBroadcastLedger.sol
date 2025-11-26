// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToLegacyBroadcastLedger {
    string public batchID = "1321.9.149";
    string public steward = "Vinvin";

    address public admin;

    struct LegacyEvent {
        string heritage;   // milestone, threat, reform
        string action;
        uint256 impact;
        uint256 timestamp;
        bool broadcasted;
    }

    LegacyEvent[] public events;

    event LegacyBroadcast(string heritage, string action, uint256 impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastLegacy(string memory heritage, string memory action, uint256 impact) public onlyAdmin {
        events.push(LegacyEvent(heritage, action, impact, block.timestamp, true));
        emit LegacyBroadcast(heritage, action, impact);
    }

    function getLegacy(uint256 index) public view returns (string memory heritage, string memory action, uint256 impact, uint256 timestamp, bool broadcasted) {
        LegacyEvent memory e = events[index];
        return (e.heritage, e.action, e.impact, e.timestamp, e.broadcasted);
    }
}
