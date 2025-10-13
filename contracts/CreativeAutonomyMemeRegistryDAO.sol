// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CreativeAutonomyMemeRegistryDAO {
    address public steward;

    struct MemeEvent {
        string memeTitle;
        string autonomyTrigger; // "Content Censorship", "Forced Branding", "Synthetic Override"
        string memeType; // "Animated Thread", "Parody PSA", "Mock Platform"
        string registryStatus; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    MemeEvent[] public events;

    event MemeLogged(
        string memeTitle,
        string autonomyTrigger,
        string memeType,
        string registryStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log creative autonomy meme rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(
        string memory memeTitle,
        string memory autonomyTrigger,
        string memory memeType,
        string memory registryStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MemeEvent({
            memeTitle: memeTitle,
            autonomyTrigger: autonomyTrigger,
            memeType: memeType,
            registryStatus: registryStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(memeTitle, autonomyTrigger, memeType, registryStatus, emotionalTag, block.timestamp);
    }

    function getMemeByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory autonomyTrigger,
        string memory memeType,
        string memory registryStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        MemeEvent memory m = events[index];
        return (
            m.memeTitle,
            m.autonomyTrigger,
            m.memeType,
            m.registryStatus,
            m.emotionalTag,
            m.timestamp
        );
    }
}
