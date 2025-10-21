// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FraudDetectionOversightGrid {
    address public admin;

    struct FraudEntry {
        string institution;
        string fraudType; // "Loan Misrepresentation", "Borrower Identity", "Asset Overstatement"
        string oversightClause;
        string emotionalTag;
        bool summoned;
        bool investigated;
        bool sealed;
    }

    FraudEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFraud(string memory institution, string memory fraudType, string memory oversightClause, string memory emotionalTag) external onlyAdmin {
        entries.push(FraudEntry(institution, fraudType, oversightClause, emotionalTag, true, false, false));
    }

    function confirmInvestigation(uint256 index) external onlyAdmin {
        entries[index].investigated = true;
    }

    function sealFraudEntry(uint256 index) external onlyAdmin {
        require(entries[index].investigated, "Must be investigated first");
        entries[index].sealed = true;
    }

    function getFraudEntry(uint256 index) external view returns (FraudEntry memory) {
        return entries[index];
    }
}
