// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MentalHealthMemeHotlineDAO {
    address public steward;

    struct HotlineEvent {
        string memeTitle;
        string hotlineFunction; // "Anxiety Support", "Burnout Relief", "Crisis Counseling"
        string parodyType; // "Animated Thread", "Mock Call Center", "Parody PSA"
        string hotlineStatus; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    HotlineEvent[] public events;

    event HotlineLogged(
        string memeTitle,
        string hotlineFunction,
        string parodyType,
        string hotlineStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log mental health meme hotline rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logHotline(
        string memory memeTitle,
        string memory hotlineFunction,
        string memory parodyType,
        string memory hotlineStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(HotlineEvent({
            memeTitle: memeTitle,
            hotlineFunction: hotlineFunction,
            parodyType: parodyType,
            hotlineStatus: hotlineStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit HotlineLogged(memeTitle, hotlineFunction, parodyType, hotlineStatus, emotionalTag, block.timestamp);
    }

    function getHotlineByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory hotlineFunction,
        string memory parodyType,
        string memory hotlineStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        HotlineEvent memory h = events[index];
        return (
            h.memeTitle,
            h.hotlineFunction,
            h.parodyType,
            h.hotlineStatus,
            h.emotionalTag,
            h.timestamp
        );
    }
}
