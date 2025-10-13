// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AgedCareMemeRegistryDAO {
    address public steward;

    struct MemeEvent {
        string memeTitle;
        string agedCareTrigger; // "Budget Cut", "Facility Neglect", "Policy Delay"
        string memeType; // "Parody PSA", "Animated Thread", "Mock Alert"
        string registryStatus; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    MemeEvent[] public events;

    event MemeLogged(
        string memeTitle,
        string agedCareTrigger,
        string memeType,
        string registryStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log aged care meme rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(
        string memory memeTitle,
        string memory agedCareTrigger,
        string memory memeType,
        string memory registryStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MemeEvent({
            memeTitle: memeTitle,
            agedCareTrigger: agedCareTrigger,
            memeType: memeType,
            registryStatus: registryStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(memeTitle, agedCareTrigger, memeType, registryStatus, emotionalTag, block.timestamp);
    }

    function getMemeByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory agedCareTrigger,
        string memory memeType,
        string memory registryStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        MemeEvent memory m = events[index];
        return (
            m.memeTitle,
            m.agedCareTrigger,
            m.memeType,
            m.registryStatus,
            m.emotionalTag,
            m.timestamp
        );
    }
}
