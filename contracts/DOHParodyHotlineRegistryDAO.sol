// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DOHParodyHotlineRegistryDAO {
    address public steward;

    struct HotlineEvent {
        string parodyTitle;
        string hotlineFunction; // "Mental Health", "Emergency Aid", "COVID Response"
        string parodyType; // "Animated Thread", "Mock Call Center", "Satirical PSA"
        string registryStatus; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    HotlineEvent[] public events;

    event HotlineLogged(
        string parodyTitle,
        string hotlineFunction,
        string parodyType,
        string registryStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log DOH parody hotline rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logHotline(
        string memory parodyTitle,
        string memory hotlineFunction,
        string memory parodyType,
        string memory registryStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(HotlineEvent({
            parodyTitle: parodyTitle,
            hotlineFunction: hotlineFunction,
            parodyType: parodyType,
            registryStatus: registryStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit HotlineLogged(parodyTitle, hotlineFunction, parodyType, registryStatus, emotionalTag, block.timestamp);
    }

    function getHotlineByIndex(uint256 index) external view returns (
        string memory parodyTitle,
        string memory hotlineFunction,
        string memory parodyType,
        string memory registryStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        HotlineEvent memory h = events[index];
        return (
            h.parodyTitle,
            h.hotlineFunction,
            h.parodyType,
            h.registryStatus,
            h.emotionalTag,
            h.timestamp
        );
    }
}
