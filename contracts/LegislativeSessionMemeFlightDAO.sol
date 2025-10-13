// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LegislativeSessionMemeFlightDAO {
    address public steward;

    struct MemeEvent {
        string memeTitle; // "Budget Blockbuster", "Diokno vs ₱243B"
        string sessionTrigger; // "Second Reading", "Amendment Vote"
        string memeType; // "Animated Thread", "Parody PSA", "Floor Satire"
        string flightStatus; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    MemeEvent[] public events;

    event MemeLogged(
        string memeTitle,
        string sessionTrigger,
        string memeType,
        string flightStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log legislative meme flights");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(
        string memory memeTitle,
        string memory sessionTrigger,
        string memory memeType,
        string memory flightStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MemeEvent({
            memeTitle: memeTitle,
            sessionTrigger: sessionTrigger,
            memeType: memeType,
            flightStatus: flightStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(memeTitle, sessionTrigger, memeType, flightStatus, emotionalTag, block.timestamp);
    }
}
