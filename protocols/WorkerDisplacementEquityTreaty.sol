// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerDisplacementEquityTreaty {
    address public steward;

    struct DisplacementClause {
        string workerName;
        string previousRole;
        string supportPath;
        string emotionalTag;
    }

    DisplacementClause[] public treatyLog;

    event WorkerDisplacementTagged(string workerName, string previousRole, string supportPath, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagWorkerDisplacement(
        string memory workerName,
        string memory previousRole,
        string memory supportPath,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(DisplacementClause(workerName, previousRole, supportPath, emotionalTag));
        emit WorkerDisplacementTagged(workerName, previousRole, supportPath, emotionalTag);
    }
}
