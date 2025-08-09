// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title CivicPayroll - Ritual scroll for rewarding journalists for authentic public behavior and clarity on camera
/// @author Vinvin
/// @notice Tracks earnings and bonus points for doing the right thing during broadcasts

contract CivicPayroll {
    address public scrollsmith;

    struct Journalist {
        string name;
        uint256 baseSalary;
        uint256 earnedPoints;
        uint256 totalPayout;
        bool isActive;
    }

    Journalist[] public journalists;

    event JournalistRegistered(string name);
    event PointsAwarded(string name, uint256 points, string reason);
    event PayoutCalculated(string name, uint256 totalPayout);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Register a journalist
    function registerJournalist(string calldata name, uint256 baseSalary) external onlyScrollsmith {
        journalists.push(Journalist(name, baseSalary, 0, baseSalary, true));
        emit JournalistRegistered(name);
    }

    /// @notice Award points for authentic behavior
    function awardPoints(uint256 journalistId, uint256 points, string calldata reason) external onlyScrollsmith {
        require(journalistId < journalists.length, "Invalid ID");
        Journalist storage j = journalists[journalistId];
        j.earnedPoints += points;
        j.totalPayout = j.baseSalary + (j.earnedPoints * 50); // Each point = ₱50 bonus
        emit PointsAwarded(j.name, points, reason);
        emit PayoutCalculated(j.name, j.totalPayout);
    }

    /// @notice View all journalists
    function getAllJournalists() external view returns (Journalist[] memory) {
        return journalists;
    }
}
