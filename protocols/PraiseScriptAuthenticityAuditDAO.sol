// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PraiseScriptAuthenticityAuditDAO {
    address public steward;

    struct AuditEntry {
        string timestamp;
        string speaker;
        string praiseTarget;
        string scriptAuthenticity;
        string deliveryClue;
        string emotionalTag;
    }

    AuditEntry[] public registry;

    event PraiseScriptAudited(string timestamp, string speaker, string praiseTarget, string scriptAuthenticity, string deliveryClue, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditScript(
        string memory timestamp,
        string memory speaker,
        string memory praiseTarget,
        string memory scriptAuthenticity,
        string memory deliveryClue,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AuditEntry(timestamp, speaker, praiseTarget, scriptAuthenticity, deliveryClue, emotionalTag));
        emit PraiseScriptAudited(timestamp, speaker, praiseTarget, scriptAuthenticity, deliveryClue, emotionalTag);
    }
}
