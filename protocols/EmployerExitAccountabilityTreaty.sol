// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmployerExitAccountabilityTreaty {
    address public steward;

    struct ExitClause {
        string employerName;
        string exitType;
        string accountabilityVerdict;
        string emotionalTag;
    }

    ExitClause[] public treatyLog;

    event EmployerExitTagged(string employerName, string exitType, string accountabilityVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEmployerExit(
        string memory employerName,
        string memory exitType,
        string memory accountabilityVerdict,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ExitClause(employerName, exitType, accountabilityVerdict, emotionalTag));
        emit EmployerExitTagged(employerName, exitType, accountabilityVerdict, emotionalTag);
    }
}
