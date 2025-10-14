// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LivestockImmunityCurriculumCodexDAO {
    address public admin;

    struct CurriculumEntry {
        string purokOrBarangay;
        string immunityFocus;
        string deliveryMethod;
        string emotionalTag;
        bool deployed;
    }

    CurriculumEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCurriculum(string memory _purokOrBarangay, string memory _immunityFocus, string memory _deliveryMethod, string memory _emotionalTag) external onlyAdmin {
        codex.push(CurriculumEntry(_purokOrBarangay, _immunityFocus, _deliveryMethod, _emotionalTag, false));
    }

    function deployCurriculum(uint256 index) external onlyAdmin {
        codex[index].deployed = true;
    }

    function getCurriculum(uint256 index) external view returns (CurriculumEntry memory) {
        return codex[index];
    }
}
