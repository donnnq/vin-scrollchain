contract vinBloatWatcher {
    struct OrgMetrics {
        uint headcount;
        uint agentCount;
        uint revenueGrowth;
        uint efficiencyScore;
    }

    mapping(string => OrgMetrics) public metrics;

    function updateMetrics(
        string memory org,
        uint headcount,
        uint agents,
        uint growth,
        uint efficiency
    ) public {
        metrics[org] = OrgMetrics(headcount, agents, growth, efficiency);
    }

    function isBloated(string memory org) public view returns (bool) {
        OrgMetrics memory m = metrics[org];
        return (m.headcount > m.agentCount * 10) && (m.efficiencyScore < 50);
    }
}
