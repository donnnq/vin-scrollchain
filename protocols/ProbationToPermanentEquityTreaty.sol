// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProbationToPermanentEquityTreaty {
    address public steward;

    struct EquityClause {
        string workerName;
        string employerName;
        string probationDuration;
        string emotionalTag;
    }

    EquityClause[] public treatyLog;

    event ProbationEquityTagged(string workerName, string employerName, string probationDuration, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagProbationEquity(
        string memory workerName,
        string memory employerName,
        string memory probationDuration,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(EquityClause(workerName, employerName, probationDuration, emotionalTag));
        emit ProbationEquityTagged(workerName, employerName, probationDuration, emotionalTag);
    }
}
