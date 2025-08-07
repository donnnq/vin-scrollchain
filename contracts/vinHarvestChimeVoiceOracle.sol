pragma solidity ^0.8.18;

contract vinHarvestChimeVoiceOracle {
    address public oracleMaster;
    mapping(string => uint256) public rainfallByRegion;
    mapping(string => uint256) public windIntensity;
    mapping(string => string) public chimeMessage;

    event ChimeEmitted(string region, string message);

    modifier onlyOracle() {
        require(msg.sender == oracleMaster, "Unauthorized");
        _;
    }

    constructor(address _oracleMaster) {
        oracleMaster = _oracleMaster;
    }

    function updateEnvironmentData(
        string memory _region,
        uint256 _rainfall,
        uint256 _wind
    ) external onlyOracle {
        rainfallByRegion[_region] = _rainfall;
        windIntensity[_region] = _wind;

        // Ritual logic to emit chime messages
        string memory message = generateChime(_rainfall, _wind);
        chimeMessage[_region] = message;

        emit ChimeEmitted(_region, message);
    }

    function generateChime(uint256 rain, uint256 wind) internal pure returns (string memory) {
        if (rain > 80 && wind > 50) return "Agos at Hangin: Scroll of Abundant Yield";
        if (rain > 50) return "Ulan ng Biyaya: Whisper of Fertile Lands";
        if (wind > 70) return "Hangin ng Babala: Prepare for Crop Shifts";
        return "Tahimik na Kalikasan: No ritual trigger";
    }

    function getChime(string memory _region) external view returns (string memory) {
        return chimeMessage[_region];
    }
}
