// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiskManagementBroadcastCurriculumDAO {
    address public admin;

    struct CurriculumEntry {
        string lessonLabel;
        string riskClause;
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

    function submitCurriculum(string memory _lessonLabel, string memory _riskClause, string memory _emotionalTag) external onlyAdmin {
        curriculum.push(CurriculumEntry(_lessonLabel, _riskClause, _emotionalTag, false));
    }

    function deployCurriculum(uint256 index) external onlyAdmin {
        curriculum[index].deployed = true;
    }

    function getCurriculum(uint256 index) external view returns (CurriculumEntry memory) {
        return curriculum[index];
    }
}
