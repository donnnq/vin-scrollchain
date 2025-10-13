// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CulinaryMemeRegistryDAO {
    address public steward;

    struct MemeEvent {
        string memeTitle;
        string foodSubject;
        string memeType; // "Satire", "Parody", "Reaction"
        string emotionalTag;
        uint256 timestamp;
    }

    MemeEvent[] public events;

    event MemeLogged(
        string memeTitle,
        string foodSubject,
        string memeType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log culinary meme rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(
        string memory memeTitle,
        string memory foodSubject,
        string memory memeType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MemeEvent({
            memeTitle: memeTitle,
            foodSubject: foodSubject,
            memeType: memeType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(memeTitle, foodSubject, memeType, emotionalTag, block.timestamp);
    }

    function getMemeByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory foodSubject,
        string memory memeType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        MemeEvent memory m = events[index];
        return (
            m.memeTitle,
            m.foodSubject,
            m.memeType,
            m.emotionalTag,
            m.timestamp
        );
    }
}
