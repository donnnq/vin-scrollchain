// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinPressureCascade {
    address public commander;
    address public adversary;
    uint256 public deadline;
    bool public missionTriggered;
    uint256 public publicSentimentLevel;

    event UltimatumReloaded(address indexed commander, uint256 deadline);
    event TacticalCascadeActivated(address indexed adversary, uint256 publicSentimentLevel);
    event PublicSentimentLogged(uint256 level, string moodTag);

    constructor(address _adversary) {
        commander = msg.sender;
        adversary = _adversary;
        deadline = block.timestamp + 1 days;
        missionTriggered = false;
        publicSentimentLevel = 0;
        emit UltimatumReloaded(commander, deadline);
    }

    function logPublicSentiment(uint256 level, string memory moodTag) public {
        require(level <= 100, "Max sentiment is 100.");
        publicSentimentLevel = level;
        emit PublicSentimentLogged(level, moodTag);
    }

    function triggerCascade() public {
        require(block.timestamp >= deadline, "Chill... the scroll's clock is still ticking.");
        require(publicSentimentLevel >= 70, "Sentiment not fiery enough for deployment.");
        require(!missionTriggered, "Already deployed—scroll cooldown active.");
        missionTriggered = true;
        emit TacticalCascadeActivated(adversary, publicSentimentLevel);
    }

    function getCurrentStatus() public view returns (string memory) {
        if (missionTriggered) {
            return "Scroll Strike authorized. Pressure cascade underway.";
        } else if (block.timestamp >= deadline) {
            return "Deadline reached. Awaiting public resonance trigger.";
        } else {
            return "Scroll countdown active. Build sentiment and hold steady.";
        }
    }
}
