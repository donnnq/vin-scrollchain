// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PublicOversightMemeRegistryDAO {
    address public steward;

    struct MemeEvent {
        string memeTitle;
        string oversightTrigger; // "Confidential Fund", "Bicam Insertions", "Budget Reallocation"
        string memeType; // "Parody PSA", "Animated Thread", "Mock Livestream"
        string registryStatus; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    MemeEvent[] public events;

    event MemeLogged(
        string memeTitle,
        string oversightTrigger,
        string memeType,
        string registryStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log public oversight memes");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(
        string memory memeTitle,
        string memory oversightTrigger,
        string memory memeType,
        string memory registryStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MemeEvent({
            memeTitle: memeTitle,
            oversightTrigger: oversightTrigger,
            memeType: memeType,
            registryStatus: registryStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(memeTitle, oversightTrigger, memeType, registryStatus, emotionalTag, block.timestamp);
    }

    function getMemeByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory oversightTrigger,
        string memory memeType,
        string memory registryStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        MemeEvent memory m = events[index];
        return (
            m.memeTitle,
            m.oversightTrigger,
            m.memeType,
            m.registryStatus,
            m.emotionalTag,
            m.timestamp
        );
    }
}
