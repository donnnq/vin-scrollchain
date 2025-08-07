// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinPinas2Point0NarrativeBeacon
/// @dev Stores and emits the symbolic milestones of national transformation

contract vinPinas2Point0NarrativeBeacon {
    address public visionary;

    struct Milestone {
        string title;
        string description;
        string executingBarangay;
        uint256 timestamp;
    }

    Milestone[] public milestones;
    string public transformationNarrative;
    string[] public honoredBarangays;

    event MilestoneLogged(string indexed title, string executingBarangay);
    event NarrativeUpdated(string newText);
    event BarangayHonored(string barangay);

    modifier onlyVisionary() {
        require(msg.sender == visionary, "Only Vinvin can invoke");
        _;
    }

    constructor(string memory initialNarrative) {
        visionary = msg.sender;
        transformationNarrative = initialNarrative;
    }

    function logMilestone(
        string memory title,
        string memory description,
        string memory executingBarangay
    ) public onlyVisionary {
        milestones.push(Milestone(title, description, executingBarangay, block.timestamp));
        emit MilestoneLogged(title, executingBarangay);
    }

    function updateNarrative(string memory newText) public onlyVisionary {
        transformationNarrative = newText;
        emit NarrativeUpdated(newText);
    }

    function honorBarangay(string memory name) public onlyVisionary {
        honoredBarangays.push(name);
        emit BarangayHonored(name);
    }

    function getAllMilestones() public view returns (Milestone[] memory) {
        return milestones;
    }

    function getNarrative() public view returns (string memory) {
        return transformationNarrative;
    }

    function listHonoredBarangays() public view returns (string[] memory) {
        return honoredBarangays;
    }
}
