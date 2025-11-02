// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayResumeDAO {
    address public steward;

    struct ResumeEntry {
        string residentName;
        string skillSet;
        string resumeLink;
        string emotionalTag;
    }

    ResumeEntry[] public registry;

    event ResumeTagged(string residentName, string skillSet, string resumeLink, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResume(
        string memory residentName,
        string memory skillSet,
        string memory resumeLink,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ResumeEntry(residentName, skillSet, resumeLink, emotionalTag));
        emit ResumeTagged(residentName, skillSet, resumeLink, emotionalTag);
    }
}
