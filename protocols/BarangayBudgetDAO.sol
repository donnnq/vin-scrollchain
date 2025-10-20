// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayBudgetDAO {
    address public admin;

    struct BudgetEntry {
        string barangayName;
        string allocationType;
        string equityClause;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    BudgetEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBudget(string memory barangayName, string memory allocationType, string memory equityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(BudgetEntry(barangayName, allocationType, equityClause, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealBudgetEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getBudgetEntry(uint256 index) external view returns (BudgetEntry memory) {
        return entries[index];
    }
}
