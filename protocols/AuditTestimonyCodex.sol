// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditTestimonyCodex {
    address public admin;

    struct TestimonyEntry {
        string hearingTitle;
        string witnessName;
        string testimonyType; // "Fraud Disclosure", "Budget Leak", "Ghost Project Confirmation"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    TestimonyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTestimony(string memory hearingTitle, string memory witnessName, string memory testimonyType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TestimonyEntry(hearingTitle, witnessName, testimonyType, codexClause, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealTestimonyEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getTestimonyEntry(uint256 index) external view returns (TestimonyEntry memory) {
        return entries[index];
    }
}
