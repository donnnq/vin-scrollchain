// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PostLayoffJobEquityTreaty {
    address public steward;

    struct JobClause {
        string workerName;
        string newEmployer;
        string jobRole;
        string emotionalTag;
    }

    JobClause[] public treatyLog;

    event PostLayoffJobTagged(string workerName, string newEmployer, string jobRole, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPostLayoffJob(
        string memory workerName,
        string memory newEmployer,
        string memory jobRole,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(JobClause(workerName, newEmployer, jobRole, emotionalTag));
        emit PostLayoffJobTagged(workerName, newEmployer, jobRole, emotionalTag);
    }
}
