// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankingTransparencyIndex {
    address public admin;

    struct TransparencyEntry {
        string institution;
        string issueType; // "Loan Disclosure", "Fraud Oversight", "Borrower Clarity"
        string indexClause;
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    TransparencyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTransparency(string memory institution, string memory issueType, string memory indexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TransparencyEntry(institution, issueType, indexClause, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealTransparencyEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getTransparencyEntry(uint256 index) external view returns (TransparencyEntry memory) {
        return entries[index];
    }
}
