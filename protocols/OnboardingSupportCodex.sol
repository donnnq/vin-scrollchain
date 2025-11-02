// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OnboardingSupportCodex {
    address public steward;

    struct OnboardingClause {
        string workerName;
        string supportType;
        string completionStatus;
        string emotionalTag;
    }

    OnboardingClause[] public codex;

    event OnboardingSupportLogged(string workerName, string supportType, string completionStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logOnboardingSupport(
        string memory workerName,
        string memory supportType,
        string memory completionStatus,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(OnboardingClause(workerName, supportType, completionStatus, emotionalTag));
        emit OnboardingSupportLogged(workerName, supportType, completionStatus, emotionalTag);
    }
}
