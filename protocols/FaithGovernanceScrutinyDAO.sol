// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FaithGovernanceScrutinyDAO {
    address public steward;

    struct ScrutinyEntry {
        string organization;
        string governanceAspect;
        string civicConcern;
        string emotionalTag;
    }

    ScrutinyEntry[] public registry;

    event FaithGovernanceScrutinized(string organization, string governanceAspect, string civicConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function scrutinizeGovernance(
        string memory organization,
        string memory governanceAspect,
        string memory civicConcern,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ScrutinyEntry(organization, governanceAspect, civicConcern, emotionalTag));
        emit FaithGovernanceScrutinized(organization, governanceAspect, civicConcern, emotionalTag);
    }
}
