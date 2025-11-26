// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToThreatBroadcastLedger {
    string public batchID = "1321.9.140";
    string public steward = "Vinvin";

    address public admin;

    struct ThreatEvent {
        string asset;
        string trigger; // sabotage, outage, systemic shock
        uint256 severity;
        uint256 timestamp;
        bool broadcasted;
    }

    ThreatEvent[] public events;

    event ThreatBroadcast(string asset, string trigger, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastThreat(string memory asset, string memory trigger, uint256 severity) public onlyAdmin {
        events.push(ThreatEvent(asset, trigger, severity, block.timestamp, true));
        emit ThreatBroadcast(asset, trigger, severity);
    }

    function getThreat(uint256 index) public view returns (string memory asset, string memory trigger, uint256 severity, uint256 timestamp, bool broadcasted) {
        ThreatEvent memory e = events[index];
        return (e.asset, e.trigger, e.severity, e.timestamp, e.broadcasted);
    }
}
