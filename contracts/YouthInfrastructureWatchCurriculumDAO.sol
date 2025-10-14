// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthInfrastructureWatchCurriculumDAO {
    address public admin;

    struct CurriculumEntry {
        string purokOrBarangay;
        string infrastructureFocus;
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

    function submitCurriculum(string memory _purokOrBarangay, string memory _infrastructureFocus, string memory _deliveryMethod, string memory _emotionalTag) external onlyAdmin {
        curriculum.push(CurriculumEntry(_purokOrBarangay, _infrastructureFocus, _deliveryMethod, _emotionalTag, false));
    }

    function deployCurriculum(uint256 index) external onlyAdmin {
        curriculum[index].deployed = true;
    }

    function getCurriculum(uint256 index) external view returns (CurriculumEntry memory) {
        return curriculum[index];
    }
}
