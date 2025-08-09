// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title MythicAppeal - Ritual scroll for redeeming flagged users through symbolic quests and restoration
/// @author Vinvin
/// @notice Allows flagged users to submit appeals, complete quests, and restore access

contract MythicAppeal {
    address public scrollsmith;

    enum AppealStatus { None, Submitted, Approved, Denied }
    mapping(address => AppealStatus) public appeals;
    mapping(address => string) public questLog;
    mapping(address => bool) public restored;

    event AppealSubmitted(address indexed user, string reason);
    event QuestCompleted(address indexed user, string quest);
    event AccessRestored(address indexed user);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Submit an appeal with a symbolic reason
    function submitAppeal(string memory reason) external {
        require(appeals[msg.sender] == AppealStatus.None, "Appeal already submitted");
        appeals[msg.sender] = AppealStatus.Submitted;
        emit AppealSubmitted(msg.sender, reason);
    }

    /// @notice Complete a ritual quest to prove worthiness
    function completeQuest(string memory quest) external {
        require(appeals[msg.sender] == AppealStatus.Submitted, "No active appeal");
        questLog[msg.sender] = quest;
        emit QuestCompleted(msg.sender, quest);
    }

    /// @notice Restore access after successful quest
    function restoreAccess(address user) external onlyScrollsmith {
        require(keccak256(bytes(questLog[user])) != keccak256(bytes("")), "No quest completed");
        appeals[user] = AppealStatus.Approved;
        restored[user] = true;
        emit AccessRestored(user);
    }

    /// @notice Check if user has been mythically restored
    function isRestored(address user) external view returns (bool) {
        return restored[user];
    }
}
