// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RLUSDMemeAdoptionRegistryDAO {
    address public steward;

    struct MemeEvent {
        string memeTitle;
        string adoptionTrigger; // "Vault Launch", "Stablecoin Hype", "XRPfi Integration"
        string memeType; // "Parody", "Satire", "Animated Thread"
        string adoptionImpact; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    MemeEvent[] public events;

    event MemeLogged(
        string memeTitle,
        string adoptionTrigger,
        string memeType,
        string adoptionImpact,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log RLUSD meme adoption rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(
        string memory memeTitle,
        string memory adoptionTrigger,
        string memory memeType,
        string memory adoptionImpact,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MemeEvent({
            memeTitle: memeTitle,
            adoptionTrigger: adoptionTrigger,
            memeType: memeType,
            adoptionImpact: adoptionImpact,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(memeTitle, adoptionTrigger, memeType, adoptionImpact, emotionalTag, block.timestamp);
    }

    function getMemeByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory adoptionTrigger,
        string memory memeType,
        string memory adoptionImpact,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        MemeEvent memory m = events[index];
        return (
            m.memeTitle,
            m.adoptionTrigger,
            m.memeType,
            m.adoptionImpact,
            m.emotionalTag,
            m.timestamp
        );
    }
}
