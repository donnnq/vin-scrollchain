contract vinDroneWardens {
    event ReconPinged(string zone, uint dronesDetected);
    event ScrollShieldCast(string zone, uint shieldLevel);

    address public scrolllord = msg.sender;
    mapping(string => uint) public zoneShieldLevel;
    mapping(string => uint) public droneCount;

    modifier onlyScrolllord() {
        require(msg.sender == scrolllord, "Scrolllord only.");
        _;
    }

    function pingRecon(string calldata zone, uint dronesDetected) external onlyScrolllord {
        droneCount[zone] = dronesDetected;
        emit ReconPinged(zone, dronesDetected);
    }

    function castShield(string calldata zone, uint shieldLevel) external onlyScrolllord {
        zoneShieldLevel[zone] = shieldLevel;
        emit ScrollShieldCast(zone, shieldLevel);
    }

    function checkZone(string calldata zone) public view returns (uint drones, uint shield) {
        drones = droneCount[zone];
        shield = zoneShieldLevel[zone];
    }
}
