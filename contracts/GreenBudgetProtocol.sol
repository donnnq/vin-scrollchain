// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Green Budget Protocol v1.0
/// @notice Emotionally tagged smart contract for climate-tagged budgeting and fiscal resilience

contract GreenBudgetProtocol {
    struct BudgetItem {
        string name;
        uint256 amount;
        bool isClimatePositive;
        bool isResilienceTagged;
        bool isTransparent;
    }

    mapping(uint256 => BudgetItem) public budgetItems;
    uint256 public nextItemId;

    /// @notice Add a new budget item with climate and resilience tags
    function addBudgetItem(
        string memory name,
        uint256 amount,
        bool climatePositive,
        bool resilienceTagged,
        bool transparent
    ) external {
        budgetItems[nextItemId] = BudgetItem({
            name: name,
            amount: amount,
            isClimatePositive: climatePositive,
            isResilienceTagged: resilienceTagged,
            isTransparent: transparent
        });
        nextItemId++;
    }

    /// @notice Check if a budget item meets green governance standards
    function isGreenCompliant(uint256 itemId) external view returns (bool) {
        BudgetItem memory item = budgetItems[itemId];
        return item.isClimatePositive && item.isResilienceTagged && item.isTransparent;
    }

    /// @notice Get total climate-positive budget allocation
    function totalClimateBudget() external view returns (uint256 total) {
        for (uint256 i = 0; i < nextItemId; i++) {
            if (budgetItems[i].isClimatePositive) {
                total += budgetItems[i].amount;
            }
        }
    }
}
