// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ScholarAscend {
    address public scrollsmith;

    struct Scholar {
        string name;
        uint256 previousScore;
        uint256 currentScore;
        uint256 bonusClaimed;
    }

    mapping(address => Scholar) public scholars;

    event ScoreUpdated(address indexed scholar, uint256 newScore);
    event BonusGranted(address indexed scholar, uint256 bonusAmount);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function registerScholar(address scholar, string calldata name, uint256 initialScore) external onlyScrollsmith {
        scholars[scholar] = Scholar(name, initialScore, initialScore, 0);
    }

    function updateScore(address scholar, uint256 newScore) external onlyScrollsmith {
        require(newScore >= scholars[scholar].currentScore, "Score must increase");
        scholars[scholar].previousScore = scholars[scholar].currentScore;
        scholars[scholar].currentScore = newScore;
        emit ScoreUpdated(scholar, newScore);

        uint256 delta = newScore - scholars[scholar].previousScore;
        if (delta > 0) {
            uint256 bonus = delta * 10; // symbolic multiplier
            scholars[scholar].bonusClaimed += bonus;
            emit BonusGranted(scholar, bonus);
        }
    }

    function getBonus(address scholar) external view returns (uint256) {
        return scholars[scholar].bonusClaimed;
    }
}
