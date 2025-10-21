// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiverCurriculumDAO {
    address public admin;

    struct CurriculumEntry {
        string segmentName;
        string subjectFocus;
        string curriculumClause;
        string emotionalTag;
        bool summoned;
        bool taught;
        bool sealed;
    }

    CurriculumEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCurriculum(string memory segmentName, string memory subjectFocus, string memory curriculumClause, string memory emotionalTag) external onlyAdmin {
        entries.push(CurriculumEntry(segmentName, subjectFocus, curriculumClause, emotionalTag, true, false, false));
    }

    function confirmTeaching(uint256 index) external onlyAdmin {
        entries[index].taught = true;
    }

    function sealCurriculumEntry(uint256 index) external onlyAdmin {
        require(entries[index].taught, "Must be taught first");
        entries[index].sealed = true;
    }

    function getCurriculumEntry(uint256 index) external view returns (CurriculumEntry memory) {
        return entries[index];
    }
}
