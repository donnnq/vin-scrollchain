// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract XRPfiMemeOnboardingDAO {
    address public steward;

    struct MemeEvent {
        string memeTitle;
        string onboardingTrigger; // "Trustline Confusion", "Wallet Absence", "Vault UX"
        string memeType; // "Parody", "Satire", "Animated Thread"
        string onboardingImpact; // "Amplified", "Flagged", "Resolved"
        string emotionalTag;
        uint256 timestamp;
    }

    MemeEvent[] public events;

    event MemeLogged(
        string memeTitle,
        string onboardingTrigger,
        string memeType,
        string onboardingImpact,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log XRPfi meme onboarding rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(
        string memory memeTitle,
        string memory onboardingTrigger,
        string memory memeType,
        string memory onboardingImpact,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MemeEvent({
            memeTitle: memeTitle,
            onboardingTrigger: onboardingTrigger,
            memeType: memeType,
            onboardingImpact: onboardingImpact,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(memeTitle, onboardingTrigger, memeType, onboardingImpact, emotionalTag, block.timestamp);
    }

    function getMemeByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory onboardingTrigger,
        string memory memeType,
        string memory onboardingImpact,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        MemeEvent memory m = events[index];
        return (
            m.memeTitle,
            m.onboardingTrigger,
            m.memeType,
            m.onboardingImpact,
            m.emotionalTag,
            m.timestamp
        );
    }
}
