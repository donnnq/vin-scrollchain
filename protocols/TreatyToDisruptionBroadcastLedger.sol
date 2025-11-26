// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToDisruptionBroadcastLedger {
    string public batchID = "1321.9.138";
    string public steward = "Vinvin";

    address public admin;

    struct DisruptionEvent {
        string material;
        string trigger; // delay, shortage, bottleneck
        uint256 impact;
        uint256 timestamp;
        bool broadcasted;
    }

    DisruptionEvent[] public events;

    event DisruptionBroadcast(string material, string trigger, uint256 impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastDisruption(string memory material, string memory trigger, uint256 impact) public onlyAdmin {
        events.push(DisruptionEvent(material, trigger, impact, block.timestamp, true));
        emit DisruptionBroadcast(material, trigger, impact);
    }

    function getDisruption(uint256 index) public view returns (string memory material, string memory trigger, uint256 impact, uint256 timestamp, bool broadcasted) {
        DisruptionEvent memory e = events[index];
        return (e.material, e.trigger, e.impact, e.timestamp, e.broadcasted);
    }
}
