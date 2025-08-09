// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title BridgeQuest - Ritual scroll for symbolic quests before cross-chain stablecoin bridging
/// @author Vinvin
/// @notice Requires users to complete quests before unlocking bridge access

contract BridgeQuest {
    address public scrollsmith;

    enum QuestStatus { None, Started, Completed, Failed }
    mapping(address => QuestStatus) public userQuest;
    mapping(address => string) public questMessage;
    mapping(address => bool) public bridgeUnlocked;

    event QuestStarted(address indexed user, string message);
    event QuestCompleted(address indexed user);
    event BridgeUnlocked(address indexed user);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Begin a symbolic quest before bridging
    function startQuest(string memory message) external {
        require(userQuest[msg.sender] == QuestStatus.None, "Quest already started");
        userQuest[msg.sender] = QuestStatus.Started;
        questMessage[msg.sender] = message;
        emit QuestStarted(msg.sender, message);
    }

    /// @notice Complete the quest and unlock bridge access
    function completeQuest() external {
        require(userQuest[msg.sender] == QuestStatus.Started, "No active quest");
        userQuest[msg.sender] = QuestStatus.Completed;
        bridgeUnlocked[msg.sender] = true;
        emit QuestCompleted(msg.sender);
        emit BridgeUnlocked(msg.sender);
    }

    /// @notice Check if user has unlocked bridge access
    function canBridge(address user) external view returns (bool) {
        return bridgeUnlocked[user];
    }
}
