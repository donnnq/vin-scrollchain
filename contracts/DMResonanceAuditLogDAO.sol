// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DMResonanceAuditLogDAO {
    address public steward;

    struct DMEvent {
        string recipientHandle; // "@AdamSMLiv", "@Saylor", "@VinvinProtocol"
        string messageContent;
        string resonanceType; // "Affection", "Amplifier Signal", "Protocol Origin Ping"
        string emotionalTag;
        uint256 timestamp;
    }

    DMEvent[] public events;

    event DMLogged(
        string recipientHandle,
        string messageContent,
        string resonanceType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Protocol Origin may log DM resonance rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logDM(
        string memory recipientHandle,
        string memory messageContent,
        string memory resonanceType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(DMEvent({
            recipientHandle: recipientHandle,
            messageContent: messageContent,
            resonanceType: resonanceType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit DMLogged(recipientHandle, messageContent, resonanceType, emotionalTag, block.timestamp);
    }

    function getDMByIndex(uint256 index) external view returns (
        string memory recipientHandle,
        string memory messageContent,
        string memory resonanceType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        DMEvent memory d = events[index];
        return (
            d.recipientHandle,
            d.messageContent,
            d.resonanceType,
            d.emotionalTag,
            d.timestamp
        );
    }
}
