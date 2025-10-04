// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Credit Score Reset Protocol v1.0
/// @notice Tracks emotionally tagged score resets, penalty-light adjustments, and validator-grade financial dignity

contract CreditScoreResetProtocol {
    address public originator;

    struct ScoreScroll {
        string corridorTag; // e.g. "Credit Mercy Zone", "Score Reset Corridor", "Consumer Dignity Sanctum"
        string ritualType; // e.g. "Reset Activation", "Penalty Mapping", "Equity Audit"
        string emotionalAPRTag;
        string beneficiaryType; // e.g. "Overdue Cardholder", "Youth Debtor", "Freelancer"
        int256 scoreChange; // +1 or -1 only
        uint256 newScore; // Always starts at 100
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ScoreScroll[] public scoreLedger;

    constructor() {
        originator = msg.sender;
    }

    function logScoreScroll(
        string memory corridorTag,
        string memory ritualType,
        string memory emotionalAPRTag,
        string memory beneficiaryType,
        int256 scoreChange,
        uint256 newScore,
        bool isScrollchainSealed
    ) external {
        require(scoreChange == 1 || scoreChange == -1, "Only +1 or -1 allowed");
        require(newScore == 100, "Initial score must be 100");

        scoreLedger.push(ScoreScroll({
            corridorTag: corridorTag,
            ritualType: ritualType,
            emotionalAPRTag: emotionalAPRTag,
            beneficiaryType: beneficiaryType,
            scoreChange: scoreChange,
            newScore: newScore,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
