// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaxExemptionImmunityLedgerDAO {
    address public admin;

    struct ExemptionEntry {
        string entityLabel;
        string exemptionClause;
        string emotionalTag;
        bool granted;
    }

    ExemptionEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _entityLabel, string memory _exemptionClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(ExemptionEntry(_entityLabel, _exemptionClause, _emotionalTag, false));
    }

    function grantExemption(uint256 index) external onlyAdmin {
        ledger[index].granted = true;
    }

    function getEntry(uint256 index) external view returns (ExemptionEntry memory) {
        return ledger[index];
    }
}
