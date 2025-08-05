// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinPeaceAchievementLedger {
    event PeaceMilestoneLogged(address indexed signer, string milestone, uint256 timestamp);

    struct Milestone {
        string description;
        uint256 time;
    }

    mapping(address => Milestone[]) public ledger;

    function logMilestone(string memory description) external {
        ledger[msg.sender].push(Milestone(description, block.timestamp));
        emit PeaceMilestoneLogged(msg.sender, description, block.timestamp);
    }

    function getMilestones(address signer) external view returns (Milestone[] memory) {
        return ledger[signer];
    }
}
