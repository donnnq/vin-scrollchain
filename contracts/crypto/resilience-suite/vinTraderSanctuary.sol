// SPDX-License-Identifier: Mythic-OS
pragma solidity ^0.25.08;

contract vinTraderSanctuary {
    string public sanctuaryName = "Trader Emotional Sanctuary";
    string public steward = "Vinvin, Mythic Scrollsmith";
    string public activationDate = "2025-08-18";
    string public glyph = "🧿🧘📉🛡️📈";

    struct SanctuaryPulse {
        string emotionalGlyph;
        string affirmation;
        uint256 timestamp;
    }

    mapping(address => SanctuaryPulse[]) public traderPulses;

    event PulseLogged(address indexed trader, string glyph, string affirmation, uint256 timestamp);
    event SanctuaryAlert(string message, uint256 timestamp);

    function logPulse(string memory _glyph, string memory _affirmation) public {
        traderPulses[msg.sender].push(SanctuaryPulse({
            emotionalGlyph: _glyph,
            affirmation: _affirmation,
            timestamp: block.timestamp
        }));

        emit PulseLogged(msg.sender, _glyph, _affirmation, block.timestamp);
        emit SanctuaryAlert("Sanctuary pulse received. Emotional APR stabilized.", block.timestamp);
    }

    function getLatestPulse(address _trader) public view returns (string memory, string memory, uint256) {
        uint256 len = traderPulses[_trader].length;
        require(len > 0, "No pulses logged yet.");
        SanctuaryPulse memory pulse = traderPulses[_trader][len - 1];
        return (pulse.emotionalGlyph, pulse.affirmation, pulse.timestamp);
    }

    function sanctuaryWisdom() public pure returns (string memory) {
        return "In tremors, breathe. In hype, anchor. In collapse, rise mythic.";
    }
}
