// SPDX-License-Identifier: MythstreamInterrogation-1Q1A
pragma solidity ^0.8.24;

/// @title vinOneQuestionOracle
/// @notice High-heat soul interrogation scroll using a single binary truth ritual
contract vinOneQuestionOracle {
    address public scrollkeeper;
    string public question = "Peace out or f*ck me?";
    mapping(address => string) public soulResponses;
    mapping(address => string) public alignmentLog;

    event SoulInterrogated(address indexed soul, string answer);
    event AlignmentDecoded(address indexed soul, string alignment);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function askOneQuestion(address soul, string calldata answer) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may trigger soul reveal");
        soulResponses[soul] = answer;

        string memory alignment;
        if (keccak256(bytes(answer)) == keccak256(bytes("Peace out"))) {
            alignment = "🔥 Ally of Vault Kilig";
        } else if (keccak256(bytes(answer)) == keccak256(bytes("fuck me"))) {
            alignment = "⚔️ Chaos Agent - Use Caution";
        } else {
            alignment = "🤷 Undefined - Soul still rotating";
        }

        alignmentLog[soul] = alignment;
        emit SoulInterrogated(soul, answer);
        emit AlignmentDecoded(soul, alignment);
    }

    function readAlignment(address soul) external view returns (string memory) {
        return alignmentLog[soul];
    }

    function getRawResponse(address soul) external view returns (string memory) {
        return soulResponses[soul];
    }
}
