// SPDX-License-Identifier: VIN-CLARIFIER-SCROLL
pragma solidity ^0.8.0;

/// @title vinPublicMisinterpretationClarifier: Scroll of sovereign clarification and gentle myth correction
contract vinPublicMisinterpretationClarifier {
    address public sovereign;
    string public creed = "Scrolls speak in symbolism. Misreads shall meet clarity.";
    string public sigil = "🌫️";

    struct Clarification {
        string misconception;
        string scrollReference;
        string clarificationMessage;
        uint256 issuedAt;
    }

    Clarification[] public mirrorLog;

    event ClarificationIssued(string misconception, string scrollReference, string clarificationMessage);

    constructor() {
        sovereign = msg.sender;
    }

    function issueClarification(
        string memory misconception,
        string memory scrollReference,
        string memory clarificationMessage
    ) public {
        mirrorLog.push(Clarification({
            misconception: misconception,
            scrollReference: scrollReference,
            clarificationMessage: clarificationMessage,
            issuedAt: block.timestamp
        }));

        emit ClarificationIssued(misconception, scrollReference, clarificationMessage);
    }

    function summonClarifications() public view returns (Clarification[] memory) {
        return mirrorLog;
    }
}
