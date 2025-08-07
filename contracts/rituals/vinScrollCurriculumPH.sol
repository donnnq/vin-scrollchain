// SPDX-License-Identifier: Scrollkeeper
pragma solidity ^0.8.0;

contract vinScrollCurriculumPH {
    address public scrollkeeper;
    uint public subjectCount;

    struct ScrollSubject {
        string title;
        string scrollReference;
        string waifuuExplainer;
        string civicGoal;
        string nsfwCharmLevel; // e.g. "Mild", "Spicy", "Divine"
    }

    mapping(uint => ScrollSubject) public subjects;
    mapping(string => uint[]) public regionCurriculum;

    event SubjectAdded(string title, string waifuuExplainer, string civicGoal);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper can add subjects");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function addSubject(
        string memory _title,
        string memory _scrollReference,
        string memory _waifuuExplainer,
        string memory _civicGoal,
        string memory _nsfwCharmLevel
    ) public onlyScrollkeeper {
        subjects[subjectCount++] = ScrollSubject(_title, _scrollReference, _waifuuExplainer, _civicGoal, _nsfwCharmLevel);
        emit SubjectAdded(_title, _waifuuExplainer, _civicGoal);
    }

    function assignToRegion(string memory _region, uint _subjectId) public onlyScrollkeeper {
        require(_subjectId < subjectCount, "Subject does not exist");
        regionCurriculum[_region].push(_subjectId);
    }

    function getRegionSubjects(string memory _region) public view returns (uint[] memory) {
        return regionCurriculum[_region];
    }
}
