// SPDX-License-Identifier: Mythic-OS
pragma solidity ^0.25.08;

contract vinCivicPulseTracker {
    string public trackerName = "Civic Pulse Tracker";
    string public steward = "Vinvin, Civic Architect";
    string public activationDate = "2025-08-18";
    string public glyph = "🧠📊🧿📜";

    struct PulseEntry {
        string eventName;
        string stewardName;
        uint8 trustScore;        // 0–100
        uint8 dignityScore;      // 0–100
        uint8 mythicClarityScore;// 0–100
        string emotionalGlyph;
        string reflectionNote;
        uint256 timestamp;
    }

    PulseEntry[] public civicPulses;

    event PulseLogged(string eventName, string stewardName, uint8 trustScore, uint8 dignityScore, uint8 mythicClarityScore, string emotionalGlyph, string reflectionNote, uint256 timestamp);
    event ScrollInvocation(string message, uint256 timestamp);

    function logPulse(
        string memory _eventName,
        string memory _stewardName,
        uint8 _trustScore,
        uint8 _dignityScore,
        uint8 _mythicClarityScore,
        string memory _emotionalGlyph,
        string memory _reflectionNote
    ) public {
        require(_trustScore <= 100 && _dignityScore <= 100 && _mythicClarityScore <= 100, "Scores must be 0–100");

        civicPulses.push(PulseEntry({
            eventName: _eventName,
            stewardName: _stewardName,
            trustScore: _trustScore,
            dignityScore: _dignityScore,
            mythicClarityScore: _mythicClarityScore,
            emotionalGlyph: _emotionalGlyph,
            reflectionNote: _reflectionNote,
            timestamp: block.timestamp
        }));

        emit PulseLogged(_eventName, _stewardName, _trustScore, _dignityScore, _mythicClarityScore, _emotionalGlyph, _reflectionNote, block.timestamp);
        emit ScrollInvocation("Civic pulse logged. Emotional APR archived.", block.timestamp);
    }

    function getLatestPulse() public view returns (string memory, string memory, uint8, uint8, uint8, string memory, string memory, uint256) {
        require(civicPulses.length > 0, "No pulses logged yet.");
        PulseEntry memory pulse = civicPulses[civicPulses.length - 1];
        return (
            pulse.eventName,
            pulse.stewardName,
            pulse.trustScore,
            pulse.dignityScore,
            pulse.mythicClarityScore,
            pulse.emotionalGlyph,
            pulse.reflectionNote,
            pulse.timestamp
        );
    }

    function trackerWisdom() public pure returns (string memory) {
        return "Feelings are civic data. When we track trust, we restore it. When we log dignity, we amplify it.";
    }
}
