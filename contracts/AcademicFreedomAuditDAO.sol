// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AcademicFreedomAuditDAO {
    address public admin;

    struct AuditEntry {
        string professorLabel;
        string controversyTopic;
        string emotionalTag;
        bool underReview;
        bool protected;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory professorLabel, string memory controversyTopic, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(professorLabel, controversyTopic, emotionalTag, true, false));
    }

    function protectProfessor(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
