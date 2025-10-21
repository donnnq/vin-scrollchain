// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WitnessStatementSovereigntyLedger {
    address public admin;

    struct StatementEntry {
        string witnessName;
        string caseName;
        string statementType; // "Verbal", "Written", "Anonymous"
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    StatementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonStatement(string memory witnessName, string memory caseName, string memory statementType, string memory emotionalTag) external onlyAdmin {
        entries.push(StatementEntry(witnessName, caseName, statementType, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealStatementEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getStatementEntry(uint256 index) external view returns (StatementEntry memory) {
        return entries[index];
    }
}
