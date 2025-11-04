// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CongressionalOversightResilienceTreaty {
    address public steward;

    struct TreatyClause {
        string committee;
        string oversightDomain;
        string resilienceSignal;
        string emotionalTag;
    }

    TreatyClause[] public treatyLog;

    event OversightResilienceTagged(string committee, string oversightDomain, string resilienceSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory committee,
        string memory oversightDomain,
        string memory resilienceSignal,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(TreatyClause(committee, oversightDomain, resilienceSignal, emotionalTag));
        emit OversightResilienceTagged(committee, oversightDomain, resilienceSignal, emotionalTag);
    }
}
