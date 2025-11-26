// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToNarrativeBroadcastLedger {
    string public batchID = "1321.9.148";
    string public steward = "Vinvin";

    address public admin;

    struct NarrativeEvent {
        string headline;   // headline, metaphor, framing
        string action;     // shift, broadcast, reform
        uint256 impact;
        uint256 timestamp;
        bool broadcasted;
    }

    NarrativeEvent[] public events;

    event NarrativeBroadcast(string headline, string action, uint256 impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastNarrative(string memory headline, string memory action, uint256 impact) public onlyAdmin {
        events.push(NarrativeEvent(headline, action, impact, block.timestamp, true));
        emit NarrativeBroadcast(headline, action, impact);
    }

    function getNarrative(uint256 index) public view returns (string memory headline, string memory action, uint256 impact, uint256 timestamp, bool broadcasted) {
        NarrativeEvent memory e = events[index];
        return (e.headline, e.action, e.impact, e.timestamp, e.broadcasted);
    }
}
