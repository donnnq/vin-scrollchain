pragma solidity ^0.8.18;

contract vinRiceOracleSync {
    address public oracleMaster;
    mapping(string => uint256) public ricePriceByPort; // e.g. "Manila", "Batangas"
    mapping(string => uint256) public importVolumeByPort;

    event RiceDataUpdated(string port, uint256 price, uint256 volume);

    modifier onlyOracle() {
        require(msg.sender == oracleMaster, "Not authorized");
        _;
    }

    constructor(address _oracleMaster) {
        oracleMaster = _oracleMaster;
    }

    function updateRiceData(string memory _port, uint256 _price, uint256 _volume) external onlyOracle {
        ricePriceByPort[_port] = _price;
        importVolumeByPort[_port] = _volume;
        emit RiceDataUpdated(_port, _price, _volume);
    }

    function getRiceStatus(string memory _port) external view returns (uint256 price, uint256 volume) {
        return (ricePriceByPort[_port], importVolumeByPort[_port]);
    }
}
