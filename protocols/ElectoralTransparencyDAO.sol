// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ElectoralTransparencyDAO {
    address public steward;

    struct TransparencyEntry {
        string electionPhase;
        string transparencyChallenge;
        string auditAction;
        string emotionalTag;
    }

    TransparencyEntry[] public registry;

    event ElectoralTransparencyTagged(string electionPhase, string transparencyChallenge, string auditAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTransparency(
        string memory electionPhase,
        string memory transparencyChallenge,
        string memory auditAction,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TransparencyEntry(electionPhase, transparencyChallenge, auditAction, emotionalTag));
        emit ElectoralTransparencyTagged(electionPhase, transparencyChallenge, auditAction, emotionalTag);
    }
}
