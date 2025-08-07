// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinSigilTournament {
    struct Quest {
        string name;
        uint256 deadline;
        bool isActive;
    }

    struct Performance {
        bool completed;
        uint256 completionTime;
        uint256 peacePoints;
    }

    mapping(address => mapping(uint256 => Performance)) public performances;
    mapping(uint256 => Quest) public quests;
    mapping(address => uint256) public totalPeacePoints;

    uint256 public questCounter;
    address public scrollkeeper;

    event QuestRegistered(uint256 questId, string name, uint256 deadline);
    event QuestCompleted(address indexed official, uint256 questId, uint256 peacePoints);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper may manage quests");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function registerQuest(string memory _name, uint256 _deadline) public onlyScrollkeeper {
        quests[questCounter] = Quest(_name, _deadline, true);
        emit QuestRegistered(questCounter, _name, _deadline);
        questCounter++;
    }

    function completeQuest(address _addr, uint256 _questId) public onlyScrollkeeper {
        require(quests[_questId].isActive, "Quest not active");
        require(!performances[_addr][_questId].completed, "Already completed");

        uint256 peace = calculatePeacePoints(_questId);
        performances[_addr][_questId] = Performance(true, block.timestamp, peace);
        totalPeacePoints[_addr] += peace;

        emit QuestCompleted(_addr, _questId, peace);
    }

    function calculatePeacePoints(uint256 _questId) internal view returns (uint256) {
        Quest memory q = quests[_questId];
        if (block.timestamp <= q.deadline) return 10;
        else return 3;
    }

    function getPeacePoints(address _addr) public view returns (uint256) {
        return totalPeacePoints[_addr];
    }
}
