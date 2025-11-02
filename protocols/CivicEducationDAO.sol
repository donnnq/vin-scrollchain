// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicEducationDAO {
    address public steward;

    struct EducationEntry {
        string audienceGroup;
        string curriculumFocus;
        string civicOutcome;
        string emotionalTag;
    }

    EducationEntry[] public registry;

    event CivicEducationTagged(string audienceGroup, string curriculumFocus, string civicOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEducation(
        string memory audienceGroup,
        string memory curriculumFocus,
        string memory civicOutcome,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EducationEntry(audienceGroup, curriculumFocus, civicOutcome, emotionalTag));
        emit CivicEducationTagged(audienceGroup, curriculumFocus, civicOutcome, emotionalTag);
    }
}
