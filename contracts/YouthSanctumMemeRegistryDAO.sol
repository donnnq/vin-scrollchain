// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract YouthSanctumMemeRegistryDAO {
    address public steward;

    struct MemeEvent {
        string memeTitle;
        string youthTrigger; // "School Closure", "Mental Health Crisis", "Online Class Burnout"
        string memeType; // "Animated Thread", "Parody PSA", "Mock Hotline"
        string registryStatus; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    MemeEvent[] public events;

    event MemeLogged(
        string memeTitle,
        string youthTrigger,
        string memeType,
        string registryStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log youth sanctum meme rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(
        string memory memeTitle,
        string memory youthTrigger,
        string memory memeType,
        string memory registryStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MemeEvent({
            memeTitle: memeTitle,
            youthTrigger: youthTrigger,
            memeType: memeType,
            registryStatus: registryStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(memeTitle, youthTrigger, memeType, registryStatus, emotionalTag, block.timestamp);
    }

    function getMemeByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory youthTrigger,
        string memory memeType,
        string memory registryStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        MemeEvent memory m = events[index];
        return (
            m.memeTitle,
            m.youthTrigger,
            m.memeType,
            m.registryStatus,
            m.emotionalTag,
            m.timestamp
        );
    }
}
