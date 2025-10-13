// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PensionMemeFlightDAO {
    address public steward;

    struct MemeEvent {
        string memeTitle;
        string pensionTrigger; // "Offset Delay", "Tax Flip-Flop", "Indexation Freeze"
        string memeType; // "Animated Thread", "Parody PSA", "Mock Alert"
        string flightStatus; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    MemeEvent[] public events;

    event MemeLogged(
        string memeTitle,
        string pensionTrigger,
        string memeType,
        string flightStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log pension meme flights");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(
        string memory memeTitle,
        string memory pensionTrigger,
        string memory memeType,
        string memory flightStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MemeEvent({
            memeTitle: memeTitle,
            pensionTrigger: pensionTrigger,
            memeType: memeType,
            flightStatus: flightStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(memeTitle, pensionTrigger, memeType, flightStatus, emotionalTag, block.timestamp);
    }

    function getMemeByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory pensionTrigger,
        string memory memeType,
        string memory flightStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        MemeEvent memory m = events[index];
        return (
            m.memeTitle,
            m.pensionTrigger,
            m.memeType,
            m.flightStatus,
            m.emotionalTag,
            m.timestamp
        );
    }
}
