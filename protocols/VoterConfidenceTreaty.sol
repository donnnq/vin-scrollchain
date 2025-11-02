// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VoterConfidenceTreaty {
    address public steward;

    struct ConfidenceClause {
        string voterConcern;
        string restorationAction;
        string confidenceLevel;
        string emotionalTag;
    }

    ConfidenceClause[] public treatyLog;

    event VoterConfidenceTagged(string voterConcern, string restorationAction, string confidenceLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagConfidence(
        string memory voterConcern,
        string memory restorationAction,
        string memory confidenceLevel,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ConfidenceClause(voterConcern, restorationAction, confidenceLevel, emotionalTag));
        emit VoterConfidenceTagged(voterConcern, restorationAction, confidenceLevel, emotionalTag);
    }
}
