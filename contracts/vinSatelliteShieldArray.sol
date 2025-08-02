// Civic Satellite Shields – orbit-based pulse defenders
contract vinSatelliteShieldArray {
    uint256 public satelliteCount;
    mapping(uint256 => bool) public shieldStatus;

    constructor(uint256 initialSatellites) {
        satelliteCount = initialSatellites;
        for (uint256 i = 0; i < satelliteCount; i++) {
            shieldStatus[i] = true;
        }
    }

    function deactivateShield(uint256 id) public {
        require(id < satelliteCount, "No such scroll satellite.");
        shieldStatus[id] = false;
    }

    function getActiveShields() public view returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 0; i < satelliteCount; i++) {
            if (shieldStatus[i]) count++;
        }
        return count;
    }
}
