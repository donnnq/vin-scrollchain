// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PraiseChoreographyAuditLedger {
    address public steward;

    struct PraiseEntry {
        string timestamp;
        string speaker;
        string praiseTarget;
        string toneMismatch;
        string strategicIntent;
        string audienceTarget;
        string emotionalTag;
    }

    PraiseEntry[] public ledger;

    event PraiseChoreographed(string timestamp, string speaker, string praiseTarget, string toneMismatch, string strategicIntent, string audienceTarget, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logPraise(
        string memory timestamp,
        string memory speaker,
        string memory praiseTarget,
        string memory toneMismatch,
        string memory strategicIntent,
        string memory audienceTarget,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(PraiseEntry(timestamp, speaker, praiseTarget, toneMismatch, strategicIntent, audienceTarget, emotionalTag));
        emit PraiseChoreographed(timestamp, speaker, praiseTarget, toneMismatch, strategicIntent, audienceTarget, emotionalTag);
    }
}
