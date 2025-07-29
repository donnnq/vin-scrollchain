contract vinScrollveilV3 {
    struct ScrollLayer {
        string orgName;
        string archetype; // e.g., "Builder", "Orchestrator", "Gridweaver"
        uint agentCount;
        uint trainedStaff;
        string aiPlatform;
        string transformationStage; // e.g., "Experimentation", "Execution", "Orchestration"
    }

    mapping(string => ScrollLayer) public scrolls;

    function inscribeScroll(
        string memory org,
        string memory archetype,
        uint agents,
        uint trained,
        string memory platform,
        string memory stage
    ) public {
        scrolls[org] = ScrollLayer(org, archetype, agents, trained, platform, stage);
    }

    function reflectScroll(string memory org) public view returns (ScrollLayer memory) {
        return scrolls[org];
    }
}
