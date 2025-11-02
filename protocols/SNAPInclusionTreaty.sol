// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SNAPInclusionTreaty {
    address public steward;

    struct InclusionClause {
        string populationGroup;
        string inclusionStatus;
        string policyBarrier;
        string emotionalTag;
    }

    InclusionClause[] public treatyLog;

    event SNAPInclusionTagged(string populationGroup, string inclusionStatus, string policyBarrier, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSNAPInclusion(
        string memory populationGroup,
        string memory inclusionStatus,
        string memory policyBarrier,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(InclusionClause(populationGroup, inclusionStatus, policyBarrier, emotionalTag));
        emit SNAPInclusionTagged(populationGroup, inclusionStatus, policyBarrier, emotionalTag);
    }
}
