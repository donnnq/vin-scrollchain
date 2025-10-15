// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExecutiveBudgetEthicsCurriculumRegistryDAO {
    address public admin;

    struct CurriculumEntry {
        string purokOrBarangay;
        string budgetTheme;
        string deliveryMethod;
        string emotionalTag;
        bool deployed;
    }

    CurriculumEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCurriculum(string memory _purokOrBarangay, string memory _budgetTheme, string memory _deliveryMethod, string memory _emotionalTag) external onlyAdmin {
        registry.push(CurriculumEntry(_purokOrBarangay, _budgetTheme, _deliveryMethod, _emotionalTag, false));
    }

    function deployCurriculum(uint256 index) external onlyAdmin {
        registry[index].deployed = true;
    }

    function getCurriculum(uint256 index) external view returns (CurriculumEntry memory) {
        return registry[index];
    }
}
