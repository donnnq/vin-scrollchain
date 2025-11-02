// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelfManagedRequirementsEquityTreaty {
    address public steward;

    struct RequirementClause {
        string workerName;
        string documentType;
        string retrievalMethod;
        string emotionalTag;
    }

    RequirementClause[] public treatyLog;

    event SelfManagedRequirementTagged(string workerName, string documentType, string retrievalMethod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSelfManagedRequirement(
        string memory workerName,
        string memory documentType,
        string memory retrievalMethod,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(RequirementClause(workerName, documentType, retrievalMethod, emotionalTag));
        emit SelfManagedRequirementTagged(workerName, documentType, retrievalMethod, emotionalTag);
    }
}
