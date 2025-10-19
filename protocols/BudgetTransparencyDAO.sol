// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetTransparencyDAO {
    address public admin;

    struct BudgetEntry {
        string countryName;
        string department;
        uint256 allocatedAmount;
        string emotionalTag;
        bool summoned;
        bool published;
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

    function summonBudget(string memory countryName, string memory department, uint256 allocatedAmount, string memory emotionalTag) external onlyAdmin {
        entries.push(BudgetEntry(countryName, department, allocatedAmount, emotionalTag, true, false, false));
    }

    function confirmPublication(uint256 index) external onlyAdmin {
        entries[index].published = true;
    }

    function sealBudgetEntry(uint256 index) external onlyAdmin {
        require(entries[index].published, "Must be published first");
        entries[index].sealed = true;
    }

    function getBudgetEntry(uint256 index) external view returns (BudgetEntry memory) {
        return entries[index];
    }
}
