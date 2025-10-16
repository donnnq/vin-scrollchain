// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LivestreamTruthAuditDAO {
    address public admin;

    struct StatementEntry {
        string speakerLabel;
        string statementContent;
        string emotionalTag;
        bool verified;
        bool flagged;
    }

    StatementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitStatement(string memory speakerLabel, string memory statementContent, string memory emotionalTag) external onlyAdmin {
        entries.push(StatementEntry(speakerLabel, statementContent, emotionalTag, false, false));
    }

    function verifyStatement(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function flagFalsehood(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function getStatement(uint256 index) external view returns (StatementEntry memory) {
        return entries[index];
    }
}
