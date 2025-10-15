// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FactoryToSchoolCurriculumPackDAO {
    address public admin;

    struct CurriculumEntry {
        string schoolRegion;
        string factoryName;
        string curriculumTheme;
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

    function submitCurriculum(string memory _schoolRegion, string memory _factoryName, string memory _curriculumTheme, string memory _emotionalTag) external onlyAdmin {
        curriculum.push(CurriculumEntry(_schoolRegion, _factoryName, _curriculumTheme, _emotionalTag, false));
    }

    function deployCurriculum(uint256 index) external onlyAdmin {
        curriculum[index].deployed = true;
    }

    function getCurriculum(uint256 index) external view returns (CurriculumEntry memory) {
        return curriculum[index];
    }
}
