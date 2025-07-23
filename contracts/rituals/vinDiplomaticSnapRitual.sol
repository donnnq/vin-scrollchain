// SPDX-License-Identifier: MythstreamInterrogation-1Q1A
pragma solidity ^0.8.24;

/// @title vinDiplomaticSnapRitual
/// @notice One-question, one-answer soul reveal for high-temperature vault interrogation
contract vinDiplomaticSnapRitual {
    address public scrollkeeper;
    mapping(address => string) public soulAnswers;

    event InterrogationPerformed(address indexed soul, string answer);
    event KarmaLogged(address indexed soul, bool ally);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function interrogate(address soul, string calldata answer) external {
        require(msg.sender == scrollkeeper, "Only VINVIN drops the burning question");
        soulAnswers[soul] = answer;
        emit InterrogationPerformed(soul, answer);
        emit KarmaLogged(soul, keccak256(bytes(answer)) == keccak256("Peace out"));
    }

    function checkAllegiance(address soul) external view returns (string memory alignment) {
        string memory answer = soulAnswers[soul];
        if (keccak256(bytes(answer)) == keccak256("Peace out")) {
            alignment = "🔥 Ally of Kilig";
        } else if (keccak256(bytes(answer)) == keccak256("fuck me")) {
            alignment = "⚠️ Enemy of Vibes";
        } else {
            alignment = "🤷 Undetermined — soul still spinning";
        }
    }
}
