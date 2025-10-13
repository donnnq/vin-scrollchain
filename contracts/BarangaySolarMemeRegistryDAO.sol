// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangaySolarMemeRegistryDAO {
    address public steward;

    struct MemeEvent {
        string barangayName;
        string memeTitle;
        string solarTrigger; // "Brownout", "High Bill", "Grid Failure"
        string memeType; // "Animated Thread", "Parody PSA", "Mock Alert"
        string registryStatus; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    MemeEvent[] public events;

    event MemeLogged(
        string barangayName,
        string memeTitle,
        string solarTrigger,
        string memeType,
        string registryStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log barangay solar meme rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(
        string memory barangayName,
        string memory memeTitle,
        string memory solarTrigger,
        string memory memeType,
        string memory registryStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MemeEvent({
            barangayName: barangayName,
            memeTitle: memeTitle,
            solarTrigger: solarTrigger,
            memeType: memeType,
            registryStatus: registryStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(barangayName, memeTitle, solarTrigger, memeType, registryStatus, emotionalTag, block.timestamp);
    }

    function getMemeByIndex(uint256 index) external view returns (
        string memory barangayName,
        string memory memeTitle,
        string memory solarTrigger,
        string memory memeType,
        string memory registryStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        MemeEvent memory m = events[index];
        return (
            m.barangayName,
            m.memeTitle,
            m.solarTrigger,
            m.memeType,
            m.registryStatus,
            m.emotionalTag,
            m.timestamp
        );
    }
}
