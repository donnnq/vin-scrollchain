// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DailyEmploymentEquityTreaty {
    address public steward;

    struct EquityClause {
        string barangay;
        string hiringCommitment;
        string dignityVerdict;
        string emotionalTag;
    }

    EquityClause[] public treatyLog;

    event EmploymentEquityTagged(string barangay, string hiringCommitment, string dignityVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEmploymentEquity(
        string memory barangay,
        string memory hiringCommitment,
        string memory dignityVerdict,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(EquityClause(barangay, hiringCommitment, dignityVerdict, emotionalTag));
        emit EmploymentEquityTagged(barangay, hiringCommitment, dignityVerdict, emotionalTag);
    }
}
