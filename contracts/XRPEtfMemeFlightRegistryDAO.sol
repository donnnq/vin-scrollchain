// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract XRPEtfMemeFlightRegistryDAO {
    address public steward;

    struct MemeEvent {
        string memeTitle;
        string ETFTrigger; // "Spot Approval", "Nov 14 Countdown"
        string memeType; // "Animated Thread", "Parody PSA", "Chart Satire"
        string flightStatus; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    MemeEvent[] public events;

    event MemeLogged(
        string memeTitle,
        string ETFTrigger,
        string memeType,
        string flightStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log XRP ETF meme flights");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(
        string memory memeTitle,
        string memory ETFTrigger,
        string memory memeType,
        string memory flightStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MemeEvent({
            memeTitle: memeTitle,
            ETFTrigger: ETFTrigger,
            memeType: memeType,
            flightStatus: flightStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(memeTitle, ETFTrigger, memeType, flightStatus, emotionalTag, block.timestamp);
    }
}
