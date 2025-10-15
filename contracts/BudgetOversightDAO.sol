// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetOversightDAO {
    address public admin;

    struct OversightEntry {
        string chamber;
        string oversightClause;
        string emotionalTag;
        bool activated;
    }

    OversightEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _chamber, string memory _oversightClause, string memory _emotionalTag) external onlyAdmin {
        entries.push(OversightEntry(_chamber, _oversightClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
