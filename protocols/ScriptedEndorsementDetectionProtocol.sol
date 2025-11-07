// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScriptedEndorsementDetectionProtocol {
    address public steward;

    struct EndorsementEntry {
        string timestamp;
        string speaker;
        string praiseTarget;
        string deliveryTone;
        string contextClue;
        string civicConsequence;
        string emotionalTag;
    }

    EndorsementEntry[] public protocol;

    event ScriptedEndorsementFlagged(string timestamp, string speaker, string praiseTarget, string deliveryTone, string contextClue, string civicConsequence, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function flagEndorsement(
        string memory timestamp,
        string memory speaker,
        string memory praiseTarget,
        string memory deliveryTone,
        string memory contextClue,
        string memory civicConsequence,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(EndorsementEntry(timestamp, speaker, praiseTarget, deliveryTone, contextClue, civicConsequence, emotionalTag));
        emit ScriptedEndorsementFlagged(timestamp, speaker, praiseTarget, deliveryTone, contextClue, civicConsequence, emotionalTag);
    }
}
