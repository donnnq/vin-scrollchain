// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliticalPraiseEmotionalDissonanceDetector {
    address public steward;

    struct DissonanceEntry {
        string timestamp;
        string speaker;
        string praiseTarget;
        string deliveryTone;
        string emotionalMismatch;
        string civicImpact;
        string emotionalTag;
    }

    DissonanceEntry[] public registry;

    event EmotionalDissonanceDetected(string timestamp, string speaker, string praiseTarget, string deliveryTone, string emotionalMismatch, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function detectDissonance(
        string memory timestamp,
        string memory speaker,
        string memory praiseTarget,
        string memory deliveryTone,
        string memory emotionalMismatch,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(DissonanceEntry(timestamp, speaker, praiseTarget, deliveryTone, emotionalMismatch, civicImpact, emotionalTag));
        emit EmotionalDissonanceDetected(timestamp, speaker, praiseTarget, deliveryTone, emotionalMismatch, civicImpact, emotionalTag);
    }
}
