// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalLaborPriorityTreaty {
    address public steward;

    struct PriorityClause {
        string employerName;
        string jobSiteLocation;
        string localHiringRatio;
        string emotionalTag;
    }

    PriorityClause[] public treatyLog;

    event LocalLaborPriorityTagged(string employerName, string jobSiteLocation, string localHiringRatio, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLocalLaborPriority(
        string memory employerName,
        string memory jobSiteLocation,
        string memory localHiringRatio,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(PriorityClause(employerName, jobSiteLocation, localHiringRatio, emotionalTag));
        emit LocalLaborPriorityTagged(employerName, jobSiteLocation, localHiringRatio, emotionalTag);
    }
}
