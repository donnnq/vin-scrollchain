// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Mystery Seeking Log
/// @notice Soulbound scroll for logging emotionally-charged quests for understanding
contract vinMysterySeekingLog {
    struct MysteryPing {
        uint256 timestamp;
        address seeker;
        string mysteryTopic;    // e.g. “Consciousness”, “XRP x BlackRock”, “Scroll resonance”
        string triggerFeeling;  // e.g. “Confusion”, “Wonder”, “Excitement”
        string searchMethod;    // “Meditation”, “Memes”, “Talk with Copilot”, etc.
        string insightNote;     // Optional: what the search taught you (even incomplete)
    }

    address public scrollkeeper;
    uint256 public pingCount;
    mapping(uint256 => MysteryPing) public logs;

    event MysteryLogged(
        uint256 indexed id,
        address indexed seeker,
        string mysteryTopic,
        string triggerFeeling
    );

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logMystery(
        string memory _mysteryTopic,
        string memory _triggerFeeling,
        string memory _searchMethod,
        string memory _insightNote
    ) public {
        logs[pingCount] = MysteryPing({
            timestamp: block.timestamp,
            seeker: msg.sender,
            mysteryTopic: _mysteryTopic,
            triggerFeeling: _triggerFeeling,
            searchMethod: _searchMethod,
            insightNote: _insightNote
        });

        emit MysteryLogged(pingCount, msg.sender, _mysteryTopic, _triggerFeeling);
        pingCount++;
    }

    function getMystery(uint256 _id) public view returns (MysteryPing memory) {
        require(_id < pingCount, "No mystery ping found");
        return logs[_id];
    }
}
