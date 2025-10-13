// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title DebateChoreographyDAO
 * @dev Emotionally tagged smart contract to log public discourse rituals,
 * candidate performance, and civic resonance — scrollchain-sealed consequence.
 */

contract DebateChoreographyDAO {
    address public steward;

    struct DebateEvent {
        address initiator;
        string debateName;
        string candidateName;
        string performanceTag; // "Clarifying", "Deflecting", "Disinforming", "Inspiring"
        string emotionalTag;
        uint256 timestamp;
    }

    DebateEvent[] public events;

    event DebateLogged(address indexed initiator, string debateName, string candidateName, string performanceTag, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log debate choreography rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logDebate(address initiator, string memory debateName, string memory candidateName, string memory performanceTag, string memory emotionalTag) external onlySteward {
        events.push(DebateEvent({
            initiator: initiator,
            debateName: debateName,
            candidateName: candidateName,
            performanceTag: performanceTag,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit DebateLogged(initiator, debateName, candidateName, performanceTag, emotionalTag, block.timestamp);
    }

    function getDebateByIndex(uint256 index) external view returns (address initiator, string memory debateName, string memory candidateName, string memory performanceTag, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        DebateEvent memory d = events[index];
        return (d.initiator, d.debateName, d.candidateName, d.performanceTag, d.emotionalTag, d.timestamp);
    }
}
