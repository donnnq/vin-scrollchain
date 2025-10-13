// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PurokMemeHotlineDAO {
    address public steward;

    struct HotlineEvent {
        string purokName;
        string memeTitle;
        string hotlineFunction; // "Evacuation", "Food Aid", "Medical Response"
        string memeType; // "Animated Thread", "Mock Call Center", "Parody PSA"
        string hotlineStatus; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    HotlineEvent[] public events;

    event HotlineLogged(
        string purokName,
        string memeTitle,
        string hotlineFunction,
        string memeType,
        string hotlineStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log purok meme hotline rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logHotline(
        string memory purokName,
        string memory memeTitle,
        string memory hotlineFunction,
        string memory memeType,
        string memory hotlineStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(HotlineEvent({
            purokName: purokName,
            memeTitle: memeTitle,
            hotlineFunction: hotlineFunction,
            memeType: memeType,
            hotlineStatus: hotlineStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit HotlineLogged(purokName, memeTitle, hotlineFunction, memeType, hotlineStatus, emotionalTag, block.timestamp);
    }

    function getHotlineByIndex(uint256 index) external view returns (
        string memory purokName,
        string memory memeTitle,
        string memory hotlineFunction,
        string memory memeType,
        string memory hotlineStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        HotlineEvent memory h = events[index];
        return (
            h.purokName,
            h.memeTitle,
            h.hotlineFunction,
            h.memeType,
            h.hotlineStatus,
            h.emotionalTag,
            h.timestamp
        );
    }
}
