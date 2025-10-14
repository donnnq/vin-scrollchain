// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Type1CivilizationDAO {
    address public admin;

    struct AdvancementEntry {
        string milestone;
        string energyThreshold;
        string planetaryImpact;
        string emotionalTag;
        bool achieved;
    }

    AdvancementEntry[] public milestones;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logMilestone(string memory _milestone, string memory _energyThreshold, string memory _planetaryImpact, string memory _emotionalTag) external onlyAdmin {
        milestones.push(AdvancementEntry(_milestone, _energyThreshold, _planetaryImpact, _emotionalTag, false));
    }

    function markAchieved(uint256 index) external onlyAdmin {
        milestones[index].achieved = true;
    }

    function getMilestone(uint256 index) external view returns (AdvancementEntry memory) {
        return milestones[index];
    }
}
