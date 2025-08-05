// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./vinForgivenessChamber.sol";

contract vinDAOForgivenessLoreSite {
    vinForgivenessChamber public chamber;

    constructor(address _chamber) {
        chamber = vinForgivenessChamber(_chamber);
    }

    struct RiteLore {
        string glyph;
        string emotion;
        string timestampedPhrase;
        string sentimentBadge;
    }

    function extractLore(uint trialId) external view returns (RiteLore memory) {
        (
            address respondent,
            ,
            string memory message,
            uint votesFor,
            uint votesAgainst,
            vinForgivenessChamber.ForgivenessStatus status,
            uint timestamp
        ) = chamber.rites(trialId);

        string memory glyph = _stylizeRespondent(respondent);
        string memory emotion = _analyzeSentiment(message);
        string memory timestampedPhrase = _ritualizeTime(message, timestamp);
        string memory sentimentBadge = _composeBadge(votesFor, votesAgainst, status);

        return RiteLore(glyph, emotion, timestampedPhrase, sentimentBadge);
    }

    function _stylizeRespondent(address respondent) internal pure returns (string memory) {
        return string(abi.encodePacked("ScrollBearer_", _toHexString(uint160(respondent))));
    }

    function _analyzeSentiment(string memory message) internal pure returns (string memory) {
        bytes memory m = bytes(message);
        if (m.length > 30) return "Reflective";
        if (m.length > 15) return "Hopeful";
        return "Urgent";
    }

    function _ritualizeTime(string memory message, uint timestamp) internal pure returns (string memory) {
        return string(abi.encodePacked("🕯️ ", message, " • ", _toString(timestamp)));
    }

    function _composeBadge(uint forVotes, uint againstVotes, vinForgivenessChamber.ForgivenessStatus status) internal pure returns (string memory) {
        if (status == vinForgivenessChamber.ForgivenessStatus.Accepted) return "🫱🏽‍🫲🏾 Accepted";
        if (status == vinForgivenessChamber.ForgivenessStatus.Rejected) return "✖️ Denied";
        if (forVotes + againstVotes >= 5) return "⏳ In Deliberation";
        return "📜 Awaiting";
    }

    // Basic uint-to-string and address-to-hex helpers
    function _toString(uint value) internal pure returns (string memory) {
        return string(abi.encodePacked(value));
    }

    function _toHexString(uint160 value) internal pure returns (string memory) {
        bytes16 hexSymbols = "0123456789abcdef";
        bytes memory str = new bytes(40);
        for (uint i = 0; i < 20; i++) {
            str[i * 2] = hexSymbols[(value >> (8 * (19 - i)) + 4) & 0xf];
            str[i * 2 + 1] = hexSymbols[(value >> (8 * (19 - i))) & 0xf];
        }
        return string(str);
    }
}
