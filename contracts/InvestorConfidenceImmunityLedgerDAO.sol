// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvestorConfidenceImmunityLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string entityLabel;
        string confidenceClause;
        string emotionalTag;
        bool logged;
    }

    LedgerEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _entityLabel, string memory _confidenceClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(LedgerEntry(_entityLabel, _confidenceClause, _emotionalTag, false));
    }

    function logEntry(uint256 index) external onlyAdmin {
        ledger[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return ledger[index];
    }
}
