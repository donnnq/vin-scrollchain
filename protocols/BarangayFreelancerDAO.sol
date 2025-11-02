// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFreelancerDAO {
    address public steward;

    struct FreelancerEntry {
        string residentName;
        string skillSet;
        string platform;
        string emotionalTag;
    }

    FreelancerEntry[] public registry;

    event FreelancerTagged(string residentName, string skillSet, string platform, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFreelancer(
        string memory residentName,
        string memory skillSet,
        string memory platform,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(FreelancerEntry(residentName, skillSet, platform, emotionalTag));
        emit FreelancerTagged(residentName, skillSet, platform, emotionalTag);
    }
}
