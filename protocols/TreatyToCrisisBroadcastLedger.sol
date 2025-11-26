// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToCrisisBroadcastLedger {
    string public batchID = "1321.9.141";
    string public steward = "Vinvin";

    address public admin;

    struct CrisisEvent {
        string institution;
        string trigger; // bank run, shock, freeze
        uint256 severity;
        uint256 timestamp;
        bool broadcasted;
    }

    CrisisEvent[] public events;

    event CrisisBroadcast(string institution, string trigger, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastCrisis(string memory institution, string memory trigger, uint256 severity) public onlyAdmin {
        events.push(CrisisEvent(institution, trigger, severity, block.timestamp, true));
        emit CrisisBroadcast(institution, trigger, severity);
    }

    function getCrisis(uint256 index) public view returns (string memory institution, string memory trigger, uint256 severity, uint256 timestamp, bool broadcasted) {
        CrisisEvent memory e = events[index];
        return (e.institution, e.trigger, e.severity, e.timestamp, e.broadcasted);
    }
}
