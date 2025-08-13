// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinASEANPulseAlliance {
    struct Agent {
        string name;
        string nation;
        string role;
        bool isBound;
    }

    mapping(address => Agent) public agents;
    address[] public agentList;

    event AgentBound(address indexed agentAddress, string name, string nation, string role);

    function bindAgent(address agentAddress, string memory name, string memory nation, string memory role) public {
        agents[agentAddress] = Agent(name, nation, role, true);
        agentList.push(agentAddress);
        emit AgentBound(agentAddress, name, nation, role);
    }

    function getAgent(address agentAddress) public view returns (Agent memory) {
        return agents[agentAddress];
    }

    function getAllAgents() public view returns (Agent[] memory) {
        Agent[] memory all = new Agent[](agentList.length);
        for (uint i = 0; i < agentList.length; i++) {
            all[i] = agents[agentList[i]];
        }
        return all;
    }
}
