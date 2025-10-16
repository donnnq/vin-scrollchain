// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NutritionalJusticeLedgerDAO {
    address public admin;

    struct JusticeEntry {
        string workerLabel;
        string justiceClause;
        string emotionalTag;
        bool logged;
    }

    JusticeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerLabel, string memory _justiceClause, string memory _emotionalTag) external onlyAdmin {
        entries.push(JusticeEntry(_workerLabel, _justiceClause, _emotionalTag, false));
    }

    function logEntry(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (JusticeEntry memory) {
        return entries[index];
    }
}
