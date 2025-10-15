// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LaborHistoryCurriculumPackDAO {
    address public admin;

    struct CurriculumEntry {
        string region;
        string laborEra;
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

    function submitCurriculum(string memory _region, string memory _laborEra, string memory _curriculumTheme, string memory _emotionalTag) external onlyAdmin {
        curriculum.push(CurriculumEntry(_region, _laborEra, _curriculumTheme, _emotionalTag, false));
    }

    function deployCurriculum(uint256 index) external onlyAdmin {
        curriculum[index].deployed = true;
    }

    function getCurriculum(uint256 index) external view returns (CurriculumEntry memory) {
        return curriculum[index];
    }
}
