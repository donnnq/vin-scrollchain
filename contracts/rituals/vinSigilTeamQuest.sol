// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinSigilTeamQuest {
    struct TeamQuest {
        string name;
        uint256 deadline;
        address[] participants;
        bool isCompleted;
    }

    mapping(uint256 => TeamQuest) public teamQuests;
    mapping(address => uint256) public peacePoints;
    uint256 public questCounter;
    address public scrollkeeper;

    event TeamQuestCreated(uint256 questId, string name, uint256 deadline);
    event HelpRequested(address indexed requester, address indexed helper, uint256 questId);
    event QuestCompleted(uint256 questId, address[] participants, uint256 pointsEach);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper may manage quests");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function createTeamQuest(string memory _name, uint256 _deadline, address[] memory _initialParticipants) public onlyScrollkeeper {
        teamQuests[questCounter] = TeamQuest(_name, _deadline, _initialParticipants, false);
        emit TeamQuestCreated(questCounter, _name, _deadline);
        questCounter++;
    }

    function requestHelp(uint256 _questId, address _helper) public {
        TeamQuest storage q = teamQuests[_questId];
        require(!q.isCompleted, "Quest already completed");
        require(isParticipant(_questId, msg.sender), "You must be part of the quest");
        require(!isParticipant(_questId, _helper), "Helper already in quest");

        q.participants.push(_helper);
        emit HelpRequested(msg.sender, _helper, _questId);
    }

    function completeTeamQuest(uint256 _questId) public onlyScrollkeeper {
        TeamQuest storage q = teamQuests[_questId];
        require(!q.isCompleted, "Already completed");
        q.isCompleted = true;

        uint256 reward = calculatePeacePoints(q.deadline);
        for (uint256 i = 0; i < q.participants.length; i++) {
            peacePoints[q.participants[i]] += reward;
        }

        emit QuestCompleted(_questId, q.participants, reward);
    }

    function calculatePeacePoints(uint256 deadline) internal view returns (uint256) {
        if (block.timestamp <= deadline) return 8;
        else return 4;
    }

    function isParticipant(uint256 _questId, address _addr) internal view returns (bool) {
        address[] memory p = teamQuests[_questId].participants;
        for (uint256 i = 0; i < p.length; i++) {
            if (p[i] == _addr) return true;
        }
        return false;
    }

    function getPeacePoints(address _addr) public view returns (uint256) {
        return peacePoints[_addr];
    }
}
