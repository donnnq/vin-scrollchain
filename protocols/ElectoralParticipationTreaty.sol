// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ElectoralParticipationTreaty {
    address public steward;

    struct ParticipationClause {
        string voterGroup;
        string participationBarrier;
        string mobilizationAction;
        string emotionalTag;
    }

    ParticipationClause[] public treatyLog;

    event ElectoralParticipationTagged(string voterGroup, string participationBarrier, string mobilizationAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagParticipation(
        string memory voterGroup,
        string memory participationBarrier,
        string memory mobilizationAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ParticipationClause(voterGroup, participationBarrier, mobilizationAction, emotionalTag));
        emit ElectoralParticipationTagged(voterGroup, participationBarrier, mobilizationAction, emotionalTag);
    }
}
