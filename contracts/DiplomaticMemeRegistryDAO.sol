// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DiplomaticMemeRegistryDAO {
    address public steward;

    struct MemeEvent {
        string memeTitle;
        string geopoliticalContext; // "Cyber Treaty", "Tariff Dispute", "Surveillance Scandal"
        string memeType; // "Satire", "Parody", "Reaction Thread"
        string diplomaticImpact; // "Exempted", "Flagged", "Amplified"
        string emotionalTag;
        uint256 timestamp;
    }

    MemeEvent[] public events;

    event MemeLogged(
        string memeTitle,
        string geopoliticalContext,
        string memeType,
        string diplomaticImpact,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log diplomatic meme rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(
        string memory memeTitle,
        string memory geopoliticalContext,
        string memory memeType,
        string memory diplomaticImpact,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MemeEvent({
            memeTitle: memeTitle,
            geopoliticalContext: geopoliticalContext,
            memeType: memeType,
            diplomaticImpact: diplomaticImpact,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(memeTitle, geopoliticalContext, memeType, diplomaticImpact, emotionalTag, block.timestamp);
    }

    function getMemeByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory geopoliticalContext,
        string memory memeType,
        string memory diplomaticImpact,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        MemeEvent memory m = events[index];
        return (
            m.memeTitle,
            m.geopoliticalContext,
            m.memeType,
            m.diplomaticImpact,
            m.emotionalTag,
            m.timestamp
        );
    }
}
