// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CyberSovereigntyDAO {
    address public steward;

    struct ThreatEvent {
        string attackerNation;
        string targetSector; // "Military", "Industry", "Infrastructure"
        string breachType; // "Surveillance", "Disruption", "Infiltration"
        string emotionalTag;
        uint256 timestamp;
    }

    ThreatEvent[] public events;

    event ThreatLogged(
        string attackerNation,
        string targetSector,
        string breachType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log cyber sovereignty rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logThreat(
        string memory attackerNation,
        string memory targetSector,
        string memory breachType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ThreatEvent({
            attackerNation: attackerNation,
            targetSector: targetSector,
            breachType: breachType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ThreatLogged(attackerNation, targetSector, breachType, emotionalTag, block.timestamp);
    }

    function getThreatByIndex(uint256 index) external view returns (
        string memory attackerNation,
        string memory targetSector,
        string memory breachType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ThreatEvent memory t = events[index];
        return (
            t.attackerNation,
            t.targetSector,
            t.breachType,
            t.emotionalTag,
            t.timestamp
        );
    }
}
