// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorReputationLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string contractorName;
        string projectReference;
        string reputationScore;
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

    function submitEntry(string memory _contractorName, string memory _projectReference, string memory _reputationScore, string memory _emotionalTag) external onlyAdmin {
        ledger.push(LedgerEntry(_contractorName, _projectReference, _reputationScore, _emotionalTag, false));
    }

    function logEntry(uint256 index) external onlyAdmin {
        ledger[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return ledger[index];
    }
}
