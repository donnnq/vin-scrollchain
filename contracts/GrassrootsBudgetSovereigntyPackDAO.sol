// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GrassrootsBudgetSovereigntyPackDAO {
    address public admin;

    struct SovereigntyEntry {
        string barangayName;
        string budgetClause;
        string emotionalTag;
        bool ratified;
    }

    SovereigntyEntry[] public pack;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _barangayName, string memory _budgetClause, string memory _emotionalTag) external onlyAdmin {
        pack.push(SovereigntyEntry(_barangayName, _budgetClause, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        pack[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return pack[index];
    }
}
