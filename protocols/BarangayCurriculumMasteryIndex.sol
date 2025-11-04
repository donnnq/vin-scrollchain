// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayCurriculumMasteryIndex {
    address public steward;

    struct MasteryEntry {
        string barangay;
        string subjectDomain;
        string masteryScore;
        string emotionalTag;
    }

    MasteryEntry[] public index;

    event CurriculumMasteryIndexed(string barangay, string subjectDomain, string masteryScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexMastery(
        string memory barangay,
        string memory subjectDomain,
        string memory masteryScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(MasteryEntry(barangay, subjectDomain, masteryScore, emotionalTag));
        emit CurriculumMasteryIndexed(barangay, subjectDomain, masteryScore, emotionalTag);
    }
}
