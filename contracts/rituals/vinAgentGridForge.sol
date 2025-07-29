contract vinAgentGridForge {
    struct AgentDeployment {
        string company;
        uint deployedAgents;
        uint trainedEmployees;
        string orchestrationPlatform;
        bool revenueDisclosed;
    }

    mapping(string => AgentDeployment) public deployments;

    function registerDeployment(
        string memory company,
        uint agents,
        uint trained,
        string memory platform,
        bool revenueFlag
    ) public {
        deployments[company] = AgentDeployment(company, agents, trained, platform, revenueFlag);
    }

    function getDeployment(string memory company) public view returns (AgentDeployment memory) {
        return deployments[company];
    }
}
