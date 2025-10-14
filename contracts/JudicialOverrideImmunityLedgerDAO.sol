// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialOverrideImmunityLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string judgeName;
        string overrideContext;
        string immunityClause;
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

    function submitEntry(string memory _judgeName, string memory _overrideContext, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(LedgerEntry(_judgeName, _overrideContext, _immunityClause, _emotionalTag, false));
    }

    function logEntry(uint256 index) external onlyAdmin {
        ledger[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return ledger[index];
    }
}
