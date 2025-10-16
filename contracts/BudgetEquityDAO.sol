// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetEquityDAO {
    address public admin;

    struct EquityEntry {
        string sector;
        string taxPolicy;
        string emotionalTag;
        bool ratified;
    }

    EquityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory sector, string memory taxPolicy, string memory emotionalTag) external onlyAdmin {
        entries.push(EquityEntry(sector, taxPolicy, emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (EquityEntry memory) {
        return entries[index];
    }
}
