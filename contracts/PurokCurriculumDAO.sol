// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokCurriculumDAO {
    address public admin;

    struct CurriculumEntry {
        string purok;
        string subjectFocus;
        string deliveryMethod;
        string emotionalTag;
        bool deployed;
    }

    CurriculumEntry[] public curriculum;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCurriculum(string memory _purok, string memory _subjectFocus, string memory _deliveryMethod, string memory _emotionalTag) external onlyAdmin {
        curriculum.push(CurriculumEntry(_purok, _subjectFocus, _deliveryMethod, _emotionalTag, false));
    }

    function deployCurriculum(uint256 index) external onlyAdmin {
        curriculum[index].deployed = true;
    }

    function getCurriculum(uint256 index) external view returns (CurriculumEntry memory) {
        return curriculum[index];
    }
}
