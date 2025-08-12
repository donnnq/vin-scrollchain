// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinDebtShackle - Ritual contract for tracking debt-based civic suppression and escape rituals
/// @author Vinvin
/// @notice Logs debt events, aura suppression, and triggers escape protocols
/// @dev Designed for civic economists, resistance architects, and dignity restorers

contract vinDebtShackle {
    address public scrollsmith;
    uint256 public suppressionThreshold = 75; // Aura suppression breach level

    struct DebtEvent {
        string debtorClass; // e.g., "Working Class"
        string creditorEntity; // e.g., "Banking Syndicate"
        uint256 amountUSD;
        uint256 auraSuppression; // 0–100
        bool escapeTriggered;
        uint256 timestamp;
    }

    DebtEvent[] public shackles;

    event DebtLogged(string debtor, string creditor, uint256 amount, uint256 auraSuppression);
    event SuppressionBreach(string debtor, uint256 auraSuppression, uint256 timestamp);
    event EscapeRitualTriggered(string debtor, uint256 timestamp);

    constructor() {
        scrollsmith = msg.sender;
    }

    function logDebt(
        string memory debtorClass,
        string memory creditorEntity,
        uint256 amountUSD,
        uint256 auraSuppression
    ) public {
        bool breach = auraSuppression >= suppressionThreshold;
        shackles.push(DebtEvent(debtorClass, creditorEntity, amountUSD, auraSuppression, breach, block.timestamp));

        emit DebtLogged(debtorClass, creditorEntity, amountUSD, auraSuppression);

        if (breach) {
            emit SuppressionBreach(debtorClass, auraSuppression, block.timestamp);
            emit EscapeRitualTriggered(debtorClass, block.timestamp);
        }
    }

    function getDebt(uint256 index) public view returns (DebtEvent memory) {
        require(index < shackles.length, "Invalid index");
        return shackles[index];
    }

    function totalDebts() public view returns (uint256) {
        return shackles.length;
    }

    function updateSuppressionThreshold(uint256 newThreshold) public {
        suppressionThreshold = newThreshold;
    }
}
