// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UniversalLivelihoodEquityTreaty {
    address public steward;

    struct LivelihoodClause {
        string barangay;
        string employmentType;
        string dignityVerdict;
        string emotionalTag;
    }

    LivelihoodClause[] public treatyLog;

    event LivelihoodEquityTagged(string barangay, string employmentType, string dignityVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLivelihoodEquity(
        string memory barangay,
        string memory employmentType,
        string memory dignityVerdict,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(LivelihoodClause(barangay, employmentType, dignityVerdict, emotionalTag));
        emit LivelihoodEquityTagged(barangay, employmentType, dignityVerdict, emotionalTag);
    }
}
