// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BudgetSatireMemeFlightDAO {
    address public steward;

    struct MemeEvent {
        string memeTitle;
        string budgetTrigger; // "Confidential Fund", "Last-Minute Insertions", "Offset Flip-Flop"
        string memeType; // "Animated Thread", "Parody PSA", "Mock Livestream"
        string flightStatus; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    MemeEvent[] public events;

    event MemeLogged(
        string memeTitle,
        string budgetTrigger,
        string memeType,
        string flightStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log budget satire meme flights");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(
        string memory memeTitle,
        string memory budgetTrigger,
        string memory memeType,
        string memory flightStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MemeEvent({
            memeTitle: memeTitle,
            budgetTrigger: budgetTrigger,
            memeType: memeType,
            flightStatus: flightStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(memeTitle, budgetTrigger, memeType, flightStatus, emotionalTag, block.timestamp);
    }

    function getMemeByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory budgetTrigger,
        string memory memeType,
        string memory flightStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        MemeEvent memory m = events[index];
        return (
            m.memeTitle,
            m.budgetTrigger,
            m.memeType,
            m.flightStatus,
            m.emotionalTag,
            m.timestamp
        );
    }
}
