// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ThreatBroadcastCurriculumDAO {
    address public admin;

    struct CurriculumEntry {
        string threatLabel;
        string broadcastClause;
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

    function submitCurriculum(string memory _threatLabel, string memory _broadcastClause, string memory _emotionalTag) external onlyAdmin {
        curriculum.push(CurriculumEntry(_threatLabel, _broadcastClause, _emotionalTag, false));
    }

    function deployCurriculum(uint256 index) external onlyAdmin {
        curriculum[index].deployed = true;
    }

    function getCurriculum(uint256 index) external view returns (CurriculumEntry memory) {
        return curriculum[index];
    }
}
