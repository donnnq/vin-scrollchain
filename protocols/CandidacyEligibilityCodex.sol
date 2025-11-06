// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CandidacyEligibilityCodex {
    address public steward;

    struct EligibilityClause {
        string candidateName;
        string citizenshipStatus;
        string voterIDStatus;
        string emotionalTag;
    }

    EligibilityClause[] public codex;

    event CandidacyEligibilityTagged(string candidateName, string citizenshipStatus, string voterIDStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEligibility(
        string memory candidateName,
        string memory citizenshipStatus,
        string memory voterIDStatus,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EligibilityClause(candidateName, citizenshipStatus, voterIDStatus, emotionalTag));
        emit CandidacyEligibilityTagged(candidateName, citizenshipStatus, voterIDStatus, emotionalTag);
    }
}
