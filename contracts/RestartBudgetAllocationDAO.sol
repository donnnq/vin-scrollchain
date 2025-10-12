// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title RestartBudgetAllocationDAO
 * @dev Emotionally tagged smart contract to allocate budget for displaced workers
 * returning through mercy lanes — scrollchain-sealed dignity and economic restoration.
 */

contract RestartBudgetAllocationDAO {
    address public steward;

    struct Allocation {
        address identity;
        uint256 amount;
        string corridor;
        string emotionalTag;
        uint256 timestamp;
    }

    Allocation[] public allocations;

    event BudgetAllocated(address indexed identity, uint256 amount, string corridor, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may allocate restart budget");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function allocateBudget(address identity, uint256 amount, string memory corridor, string memory emotionalTag) external onlySteward {
        allocations.push(Allocation({
            identity: identity,
            amount: amount,
            corridor: corridor,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit BudgetAllocated(identity, amount, corridor, emotionalTag, block.timestamp);
    }

    function getAllocationByIndex(uint256 index) external view returns (address identity, uint256 amount, string memory corridor, string memory emotionalTag, uint256 timestamp) {
        require(index < allocations.length, "Scrollstorm index out of bounds");
        Allocation memory a = allocations[index];
        return (a.identity, a.amount, a.corridor, a.emotionalTag, a.timestamp);
    }
}
