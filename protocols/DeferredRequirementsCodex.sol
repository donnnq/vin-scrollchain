// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeferredRequirementsCodex {
    address public steward;

    struct RequirementClause {
        string employerName;
        string requirementType;
        string gracePeriod;
        string emotionalTag;
    }

    RequirementClause[] public codex;

    event DeferredRequirementLogged(string employerName, string requirementType, string gracePeriod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logDeferredRequirement(
        string memory employerName,
        string memory requirementType,
        string memory gracePeriod,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(RequirementClause(employerName, requirementType, gracePeriod, emotionalTag));
        emit DeferredRequirementLogged(employerName, requirementType, gracePeriod, emotionalTag);
    }
}
