// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateHearingIntegrityCodex {
    address public steward;

    struct IntegrityEntry {
        string hearingTitle;
        string integritySignal;
        string oversightMechanism;
        string emotionalTag;
    }

    IntegrityEntry[] public codex;

    event SenateHearingIntegrityTagged(string hearingTitle, string integritySignal, string oversightMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagIntegrity(
        string memory hearingTitle,
        string memory integritySignal,
        string memory oversightMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(IntegrityEntry(hearingTitle, integritySignal, oversightMechanism, emotionalTag));
        emit SenateHearingIntegrityTagged(hearingTitle, integritySignal, oversightMechanism, emotionalTag);
    }
}
