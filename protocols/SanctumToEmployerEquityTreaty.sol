// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctumToEmployerEquityTreaty {
    address public steward;

    struct EmployerClause {
        string employerName;
        string hiringCommitment;
        string equityVerdict;
        string emotionalTag;
    }

    EmployerClause[] public treatyLog;

    event EmployerEquityTagged(string employerName, string hiringCommitment, string equityVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEmployerEquity(
        string memory employerName,
        string memory hiringCommitment,
        string memory equityVerdict,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(EmployerClause(employerName, hiringCommitment, equityVerdict, emotionalTag));
        emit EmployerEquityTagged(employerName, hiringCommitment, equityVerdict, emotionalTag);
    }
}
