// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CivicResonanceRegistryDAO
 * @dev Emotionally tagged smart contract to log public sentiment,
 * candidate relevance, and resonance audits — scrollchain-sealed consequence.
 */

contract CivicResonanceRegistryDAO {
    address public steward;

    struct ResonanceEvent {
        address initiator;
        string publicFigure;
        string resonanceLevel; // "High", "Fading", "Disconnected"
        string emotionalTag;
        uint256 timestamp;
    }

    ResonanceEvent[] public events;

    event ResonanceLogged(address indexed initiator, string publicFigure, string resonanceLevel, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log civic resonance rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logResonance(address initiator, string memory publicFigure, string memory resonanceLevel, string memory emotionalTag) external onlySteward {
        events.push(ResonanceEvent({
            initiator: initiator,
            publicFigure: publicFigure,
            resonanceLevel: resonanceLevel,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ResonanceLogged(initiator, publicFigure, resonanceLevel, emotionalTag, block.timestamp);
    }

    function getResonanceByIndex(uint256 index) external view returns (address initiator, string memory publicFigure, string memory resonanceLevel, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ResonanceEvent memory r = events[index];
        return (r.initiator, r.publicFigure, r.resonanceLevel, r.emotionalTag, r.timestamp);
    }
}
