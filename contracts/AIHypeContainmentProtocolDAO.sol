// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AIHypeContainmentProtocolDAO {
    address public steward;

    struct ContainmentEvent {
        string tokenOrStock;
        string hypeTrigger; // "OpenAI Deal", "Chip Surge", "Narrative Rotation"
        string containmentAction; // "Audit", "Cooldown", "Narrative Reset"
        string emotionalTag;
        uint256 timestamp;
    }

    ContainmentEvent[] public events;

    event ContainmentLogged(
        string tokenOrStock,
        string hypeTrigger,
        string containmentAction,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log AI hype containment rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logContainment(
        string memory tokenOrStock,
        string memory hypeTrigger,
        string memory containmentAction,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ContainmentEvent({
            tokenOrStock: tokenOrStock,
            hypeTrigger: hypeTrigger,
            containmentAction: containmentAction,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ContainmentLogged(tokenOrStock, hypeTrigger, containmentAction, emotionalTag, block.timestamp);
    }

    function getContainmentByIndex(uint256 index) external view returns (
        string memory tokenOrStock,
        string memory hypeTrigger,
        string memory containmentAction,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ContainmentEvent memory c = events[index];
        return (
            c.tokenOrStock,
            c.hypeTrigger,
            c.containmentAction,
            c.emotionalTag,
            c.timestamp
        );
    }
}
