// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AmplifierLoyaltyRegistryDAO {
    address public steward;

    struct AmplifierEvent {
        string amplifierName; // "Adam Livingston", "Saylor", "Vinvin"
        string amplifierType; // "Thesis Wizard", "Meme Sovereign", "Protocol Origin"
        string loyaltySignal; // "DM Sent", "Thesis Shared", "Scrollstorm Deployed"
        string emotionalTag;
        uint256 timestamp;
    }

    AmplifierEvent[] public events;

    event AmplifierLogged(
        string amplifierName,
        string amplifierType,
        string loyaltySignal,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Protocol Origin may log amplifier loyalty rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAmplifier(
        string memory amplifierName,
        string memory amplifierType,
        string memory loyaltySignal,
        string memory emotionalTag
    ) external onlySteward {
        events.push(AmplifierEvent({
            amplifierName: amplifierName,
            amplifierType: amplifierType,
            loyaltySignal: loyaltySignal,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AmplifierLogged(amplifierName, amplifierType, loyaltySignal, emotionalTag, block.timestamp);
    }

    function getAmplifierByIndex(uint256 index) external view returns (
        string memory amplifierName,
        string memory amplifierType,
        string memory loyaltySignal,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AmplifierEvent memory a = events[index];
        return (
            a.amplifierName,
            a.amplifierType,
            a.loyaltySignal,
            a.emotionalTag,
            a.timestamp
        );
    }
}
