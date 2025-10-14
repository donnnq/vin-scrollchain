// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetVisibilityDAO {
    address public admin;

    struct BudgetItem {
        string agency;
        string program;
        uint256 amount;
        bool disclosed;
    }

    BudgetItem[] public items;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitItem(string memory _agency, string memory _program, uint256 _amount) external onlyAdmin {
        items.push(BudgetItem(_agency, _program, _amount, false));
    }

    function markDisclosed(uint256 index) external onlyAdmin {
        items[index].disclosed = true;
    }

    function getItem(uint256 index) external view returns (BudgetItem memory) {
        return items[index];
    }
}
