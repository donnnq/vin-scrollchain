// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinVaultOfBudgetTransparencyTriggers {
    address public scrollkeeper;
    struct BudgetLog {
        address user;
        string purpose;
        uint256 amount;
        uint256 timestamp;
    }

    BudgetLog[] public logs;

    event BudgetLogged(address indexed user, string purpose, uint256 amount);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logBudget(address user, string memory purpose, uint256 amount) external onlyScrollkeeper {
        logs.push(BudgetLog(user, purpose, amount, block.timestamp));
        emit BudgetLogged(user, purpose, amount);
    }

    function getLog(uint256 index) external view returns (address, string memory, uint256, uint256) {
        BudgetLog memory log = logs[index];
        return (log.user, log.purpose, log.amount, log.timestamp);
    }

    function totalLogs() external view returns (uint256) {
        return logs.length;
    }
}
