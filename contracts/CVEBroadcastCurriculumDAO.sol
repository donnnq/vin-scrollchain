// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CVEBroadcastCurriculumDAO {
    address public admin;

    struct CurriculumEntry {
        string vulnerabilityLabel;
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

    function submitCurriculum(string memory _vulnerabilityLabel, string memory _broadcastClause, string memory _emotionalTag) external onlyAdmin {
        curriculum.push(CurriculumEntry(_vulnerabilityLabel, _broadcastClause, _emotionalTag, false));
    }

    function deployCurriculum(uint256 index) external onlyAdmin {
        curriculum[index].deployed = true;
    }

    function getCurriculum(uint256 index) external view returns (CurriculumEntry memory) {
        return curriculum[index];
    }
}
