// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthReconciliationDAO {
    address public admin;

    struct ReconciliationEntry {
        string caseName;
        string truthStatement;
        string reconciliationMethod;
        bool completed;
    }

    ReconciliationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _caseName, string memory _truthStatement, string memory _reconciliationMethod) external onlyAdmin {
        entries.push(ReconciliationEntry(_caseName, _truthStatement, _reconciliationMethod, false));
    }

    function markCompleted(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function getEntry(uint256 index) external view returns (ReconciliationEntry memory) {
        return entries[index];
    }
}
