contract SignalAnomalyDeck {
    address public steward = msg.sender;

    struct Anomaly {
        string origin;
        string type;
        string timestamp;
        string proxyRoute;
        bool freezeDetected;
    }

    Anomaly[] public anomalies;

    event AnomalyLogged(string origin, string type, bool freezeDetected);

    function logAnomaly(
        string memory origin,
        string memory anomalyType,
        string memory timestamp,
        string memory proxyRoute,
        bool freezeDetected
    ) public {
        anomalies.push(Anomaly(origin, anomalyType, timestamp, proxyRoute, freezeDetected));
        emit AnomalyLogged(origin, anomalyType, freezeDetected);
    }
}
