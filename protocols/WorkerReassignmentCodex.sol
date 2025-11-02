// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerReassignmentCodex {
    address public steward;

    struct ReassignmentClause {
        string workerName;
        string previousRole;
        string reassignedRole;
        string emotionalTag;
    }

    ReassignmentClause[] public codex;

    event WorkerReassigned(string workerName, string previousRole, string reassignedRole, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logReassignment(
        string memory workerName,
        string memory previousRole,
        string memory reassignedRole,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ReassignmentClause(workerName, previousRole, reassignedRole, emotionalTag));
        emit WorkerReassigned(workerName, previousRole, reassignedRole, emotionalTag);
    }
}
