// ChokepointMonitoringProtocol.sol
pragma solidity ^0.8.0;

contract ChokepointMonitoringProtocol {
    struct Incident {
        uint256 id;
        string description;   // e.g. "Ship seized in Strait"
        uint256 timestamp;
    }

    uint256 public incidentCount;
    mapping(uint256 => Incident) public incidents;

    event IncidentLogged(uint256 id, string description);

    function logIncident(string memory description) public {
        incidentCount++;
        incidents[incidentCount] = Incident(incidentCount, description, block.timestamp);
        emit IncidentLogged(incidentCount, description);
    }
}y

