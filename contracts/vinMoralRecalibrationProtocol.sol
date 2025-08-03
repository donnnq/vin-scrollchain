// SPDX-License-Identifier: Debt-Moral-Renewal
pragma solidity ^0.8.19;

contract vinMoralRecalibrationProtocol {
    address public sovereign;
    bool public gamblingBanned;
    bool public debtCleared;
    uint256 public banTimestamp;
    uint256 public redemptionTimestamp;

    event GamblingBanEnacted(uint256 timestamp);
    event DebtRedemptionDeclared(uint256 timestamp);

    modifier onlySovereign() {
        require(msg.sender == sovereign, "Access denied");
        _;
    }

    constructor() {
        sovereign = msg.sender;
        gamblingBanned = false;
        debtCleared = false;
    }

    function banGambling() external onlySovereign {
        require(!gamblingBanned, "Already banned");
        gamblingBanned = true;
        banTimestamp = block.timestamp;
        emit GamblingBanEnacted(banTimestamp);
    }

    function clearDebt() external onlySovereign {
        require(!debtCleared, "Already cleared");
        debtCleared = true;
        redemptionTimestamp = block.timestamp;
        emit DebtRedemptionDeclared(redemptionTimestamp);
    }

    function moralStatus() external view returns (string memory status) {
        if (gamblingBanned && debtCleared) {
            status = "Nation reborn: Vice eradicated, debt resolved.";
        } else if (gamblingBanned) {
            status = "Sugal ban enforced. Awaiting financial absolution.";
        } else if (debtCleared) {
            status = "Debt paid. Moral cleansing pending.";
        } else {
            status = "Awaiting recalibration rites.";
        }
    }
}
