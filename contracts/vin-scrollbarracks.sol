// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollBarracks {
    enum Status { Inactive, Active, Suspended }

    struct Agent {
        string codename;
        Status status;
        uint256 missionsSubmitted;
        uint256 missionsApproved;
    }

    struct Mission {
        address agent;
        string operation;
        string target;
        string signature;
        bool approved;
        uint256 timestamp;
    }

    mapping(address => Agent) public agents;
    Mission[] public missions;

    address public immutable commander;

    event AgentRegistered(address indexed agent, string codename);
    event MissionSubmitted(uint256 indexed id, address indexed agent, string operation, string target);
    event MissionApproved(uint256 indexed id, address indexed approver);

    modifier onlyCommander() {
        require(msg.sender == commander, "Not the commander");
        _;
    }

    constructor() {
        commander = msg.sender;
    }

    function registerAgent(address agent, string calldata codename) external onlyCommander {
        agents[agent] = Agent({
            codename: codename,
            status: Status.Active,
            missionsSubmitted: 0,
            missionsApproved: 0
        });
        emit AgentRegistered(agent, codename);
    }

    function submitMission(string calldata operation, string calldata target, string calldata signature) external {
        Agent storage a = agents[msg.sender];
        require(a.status == Status.Active, "Agent not active");

        missions.push(Mission({
            agent: msg.sender,
            operation: operation,
            target: target,
            signature: signature,
            approved: false,
            timestamp: block.timestamp
        }));

        a.missionsSubmitted += 1;
        emit MissionSubmitted(missions.length - 1, msg.sender, operation, target);
    }

    function approveMission(uint256 id) external onlyCommander {
        require(id < missions.length, "Invalid mission");
        Mission storage m = missions[id];
        require(!m.approved, "Already approved");

        m.approved = true;
        agents[m.agent].missionsApproved += 1;
        emit MissionApproved(id, msg.sender);
    }

    function getMission(uint256 id) external view returns (Mission memory) {
        require(id < missions.length, "Invalid mission");
        return missions[id];
    }

    function totalMissions() external view returns (uint256) {
        return missions.length;
    }
}
