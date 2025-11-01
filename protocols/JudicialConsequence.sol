// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialConsequence {
    address public steward;

    struct Verdict {
        string caseID;
        string defendant;
        string charge;
        string sentence;
        string emotionalTag;
    }

    Verdict[] public verdictLog;

    event VerdictTagged(string caseID, string defendant, string charge, string sentence);
    event CorruptionAuditTriggered(string caseID, string reason);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagVerdict(
        string memory caseID,
        string memory defendant,
        string memory charge,
        string memory sentence,
        string memory emotionalTag
    ) public onlySteward {
        verdictLog.push(Verdict(caseID, defendant, charge, sentence, emotionalTag));
        emit VerdictTagged(caseID, defendant, charge, sentence);
    }

    function triggerCorruptionAudit(string memory caseID, string memory reason) public onlySteward {
        emit CorruptionAuditTriggered(caseID, reason);
    }
}
