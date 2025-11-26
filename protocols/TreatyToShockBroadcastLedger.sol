// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToShockBroadcastLedger {
    string public batchID = "1321.9.134";
    string public steward = "Vinvin";

    address public admin;

    struct ShockEvent {
        string company;
        string trigger; // margin call, covenant breach, liquidation
        uint256 impact;
        uint256 timestamp;
        bool broadcasted;
    }

    ShockEvent[] public events;

    event ShockBroadcast(string company, string trigger, uint256 impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastShock(string memory company, string memory trigger, uint256 impact) public onlyAdmin {
        events.push(ShockEvent(company, trigger, impact, block.timestamp, true));
        emit ShockBroadcast(company, trigger, impact);
    }

    function getShock(uint256 index) public view returns (string memory company, string memory trigger, uint256 impact, uint256 timestamp, bool broadcasted) {
        ShockEvent memory e = events[index];
        return (e.company, e.trigger, e.impact, e.timestamp, e.broadcasted);
    }
}
