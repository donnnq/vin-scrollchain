// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiverEducationDAO {
    address public admin;

    struct EducationEntry {
        string segmentName;
        string curriculumTheme;
        string educationClause;
        string emotionalTag;
        bool summoned;
        bool taught;
        bool sealed;
    }

    EducationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEducation(string memory segmentName, string memory curriculumTheme, string memory educationClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EducationEntry(segmentName, curriculumTheme, educationClause, emotionalTag, true, false, false));
    }

    function confirmTeaching(uint256 index) external onlyAdmin {
        entries[index].taught = true;
    }

    function sealEducationEntry(uint256 index) external onlyAdmin {
        require(entries[index].taught, "Must be taught first");
        entries[index].sealed = true;
    }

    function getEducationEntry(uint256 index) external view returns (EducationEntry memory) {
        return entries[index];
    }
}
