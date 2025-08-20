contract ShuffleMapOverlay {
    address public steward = msg.sender;
    mapping(string => bool) public coordinationZones;
    mapping(string => string) public zoneStatus;

    event ZoneMarked(string zone);
    event StatusUpdated(string zone, string status);

    function markZone(string memory zone) public {
        coordinationZones[zone] = true;
        zoneStatus[zone] = "Monitoring";
        emit ZoneMarked(zone);
    }

    function updateZoneStatus(string memory zone, string memory status) public {
        require(coordinationZones[zone], "Zone not marked");
        zoneStatus[zone] = status;
        emit StatusUpdated(zone, status);
    }
}
