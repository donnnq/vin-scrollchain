// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangaySkillsMatchingDAO {
    address public steward;

    struct SkillMatch {
        string residentName;
        string skillSet;
        string matchedSector;
        string emotionalTag;
    }

    SkillMatch[] public registry;

    event SkillsMatched(string residentName, string skillSet, string matchedSector, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function matchSkills(
        string memory residentName,
        string memory skillSet,
        string memory matchedSector,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SkillMatch(residentName, skillSet, matchedSector, emotionalTag));
        emit SkillsMatched(residentName, skillSet, matchedSector, emotionalTag);
    }
}
