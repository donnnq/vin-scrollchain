// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegularizationTrackerTreaty {
    address public steward;

    struct RegularizationClause {
        string workerName;
        string employerName;
        string probationDuration;
        string regularizationStatus;
        string emotionalTag;
    }

    RegularizationClause[] public treatyLog;

    event RegularizationTagged(string workerName, string employerName, string probationDuration, string regularizationStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRegularization(
        string memory workerName,
        string memory employerName,
        string memory probationDuration,
        string memory regularizationStatus,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(RegularizationClause(workerName, employerName, probationDuration, regularizationStatus, emotionalTag));
        emit RegularizationTagged(workerName, employerName, probationDuration, regularizationStatus, emotionalTag);
    }
}
