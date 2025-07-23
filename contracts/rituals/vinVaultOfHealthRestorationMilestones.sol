// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinVaultOfHealthRestorationMilestones {
    address public scrollkeeper;

    struct HealthMilestone {
        string patientName;
        string stage; // "diagnosis", "treatment", "recovery", "renewal"
        string reflection;
        uint256 timestamp;
    }

    HealthMilestone[] public milestones;

    event MilestoneLogged(string patientName, string stage);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logMilestone(string memory patientName, string memory stage, string memory reflection) external onlyScrollkeeper {
        milestones.push(HealthMilestone(patientName, stage, reflection, block.timestamp));
        emit MilestoneLogged(patientName, stage);
    }

    function getMilestone(uint256 index) external view returns (string memory, string memory, string memory, uint256) {
        HealthMilestone memory m = milestones[index];
        return (m.patientName, m.stage, m.reflection, m.timestamp);
    }

    function totalMilestones() external view returns (uint256) {
        return milestones.length;
    }
}
