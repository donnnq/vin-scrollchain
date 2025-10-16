// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProfessorialSovereigntyDAO {
    address public admin;

    struct ProfessorEntry {
        string professorLabel;
        string fieldOfStudy;
        string emotionalTag;
        bool protected;
        bool underScrutiny;
    }

    ProfessorEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProfessor(string memory professorLabel, string memory fieldOfStudy, string memory emotionalTag) external onlyAdmin {
        entries.push(ProfessorEntry(professorLabel, fieldOfStudy, emotionalTag, false, false));
    }

    function protectProfessor(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function markUnderScrutiny(uint256 index) external onlyAdmin {
        entries[index].underScrutiny = true;
    }

    function getProfessor(uint256 index) external view returns (ProfessorEntry memory) {
        return entries[index];
    }
}
