// SPDX-License-Identifier: ProphecyClause
pragma solidity ^0.8.0;

contract SingularityCountdown {
    uint256 public prophecyYear = 2032;
    mapping(uint256 => string) public milestones;

    event MilestoneSet(uint256 year, string description);

    function setMilestone(uint256 year, string memory description) public {
        require(year <= prophecyYear, "Beyond prophecy threshold");
        milestones[year] = description;
        emit MilestoneSet(year, description);
    }

    function getMilestone(uint256 year) public view returns (string memory) {
        return milestones[year];
    }
}
