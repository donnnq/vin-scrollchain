// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicCaseFilingDAO {
    address public admin;

    struct CaseEntry {
        string respondent;
        string allegedViolation;
        string emotionalTag;
        bool summoned;
        bool filed;
        bool escalatedToCourt;
    }

    CaseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCase(string memory respondent, string memory allegedViolation, string memory emotionalTag) external onlyAdmin {
        entries.push(CaseEntry(respondent, allegedViolation, emotionalTag, true, false, false));
    }

    function fileCase(uint256 index) external onlyAdmin {
        entries[index].filed = true;
    }

    function escalateToCourt(uint256 index) external onlyAdmin {
        require(entries[index].filed, "Must be filed first");
        entries[index].escalatedToCourt = true;
    }

    function getCaseEntry(uint256 index) external view returns (CaseEntry memory) {
        return entries[index];
    }
}
