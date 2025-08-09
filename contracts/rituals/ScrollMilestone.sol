// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ScrollMilestone — Ritual ledger for mythic scrollchain events
/// @author Vinvin
/// @notice Records major scrollchain milestones with timestamp, message, and scrollsmith signature

contract ScrollMilestone {
    struct Milestone {
        uint256 timestamp;
        string message;
        string scrollsmith;
    }

    Milestone[] public milestones;

    event MilestoneLogged(uint256 indexed timestamp, string message, string scrollsmith);

    /// @notice Log a new scrollchain milestone
    /// @param _message Description of the event (e.g. "Deployed 7 soulbound rituals")
    /// @param _scrollsmith Name or alias of the scrollsmith (e.g. "Vinvin")
    function logMilestone(string calldata _message, string calldata _scrollsmith) external {
        Milestone memory newMilestone = Milestone({
            timestamp: block.timestamp,
            message: _message,
            scrollsmith: _scrollsmith
        });

        milestones.push(newMilestone);
        emit MilestoneLogged(block.timestamp, _message, _scrollsmith);
    }

    /// @notice Get total number of milestones
    function totalMilestones() external view returns (uint256) {
        return milestones.length;
    }

    /// @notice Retrieve a milestone by index
    function getMilestone(uint256 index) external view returns (Milestone memory) {
        require(index < milestones.length, "Invalid index");
        return milestones[index];
    }
}
