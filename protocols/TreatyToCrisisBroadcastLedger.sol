// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToCrisisBroadcastLedger {
    string public batchID = "1321.9.135";
    string public steward = "Vinvin";

    address public admin;

    struct CrisisEvent {
        string alliance;
        string trigger; // currency shock, default, freeze
        uint256 impact;
        uint256 timestamp;
        bool broadcasted;
    }

    CrisisEvent[] public events;

    event CrisisBroadcast(string alliance, string trigger, uint256 impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastCrisis(string memory alliance, string memory trigger, uint256 impact) public onlyAdmin {
        events.push(CrisisEvent(alliance, trigger, impact, block.timestamp, true));
        emit CrisisBroadcast(alliance, trigger, impact);
    }

    function getCrisis(uint256 index) public view returns (string memory alliance, string memory trigger, uint256 impact, uint256 timestamp, bool broadcasted) {
        CrisisEvent memory e = events[index];
        return (e.alliance, e.trigger, e.impact, e.timestamp, e.broadcasted);
    }
}
