// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollSideQuest {
    struct Quest {
        string title;
        string description;
        uint256 reward;
        bool active;
    }

    Quest[] public quests;
    mapping(address => mapping(uint256 => bool)) public completed;

    event QuestAdded(string title, uint256 reward);
    event QuestCompleted(address indexed player, uint256 questId);

    function addQuest(string calldata title, string calldata description, uint256 reward) external {
        quests.push(Quest(title, description, reward, true));
        emit QuestAdded(title, reward);
    }

    function completeQuest(uint256 questId) external {
        require(questId < quests.length, "Invalid quest");
        require(quests[questId].active, "Quest inactive");
        require(!completed[msg.sender][questId], "Already completed");

        completed[msg.sender][questId] = true;
        emit QuestCompleted(msg.sender, questId);
        // Reward logic handled off-chain or via token contract
    }

    function getQuest(uint256 questId) external view returns (string memory, string memory, uint256, bool) {
        Quest memory q = quests[questId];
        return (q.title, q.description, q.reward, q.active);
    }
}
