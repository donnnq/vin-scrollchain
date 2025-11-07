// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AutonomousThreatDisarmamentDAO {
    address public steward;

    struct DisarmEvent {
        string threatID;
        string overrideCode;
        string timestamp;
        string disarmMethod;
        string emotionalTag;
    }

    DisarmEvent[] public registry;

    event ThreatDisarmed(string threatID, string overrideCode, string timestamp, string disarmMethod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function disarmThreat(
        string memory threatID,
        string memory overrideCode,
        string memory timestamp,
        string memory disarmMethod,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(DisarmEvent(threatID, overrideCode, timestamp, disarmMethod, emotionalTag));
        emit ThreatDisarmed(threatID, overrideCode, timestamp, disarmMethod, emotionalTag);
    }
}
