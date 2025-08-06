// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinJollibeeInfraGate {
    address public deployArchitect;

    struct CityStatus {
        bool hasJollibee;
        uint256 infraCount;
    }

    mapping(string => CityStatus) public cityData;

    event JollibeeVerified(string city);
    event InfraDeployed(string city, uint256 count);

    modifier onlyArchitect() {
        require(msg.sender == deployArchitect, "Not authorized");
        _;
    }

    constructor(address _architect) {
        deployArchitect = _architect;
    }

    function verifyJollibee(string memory city) external onlyArchitect {
        cityData[city].hasJollibee = true;
        emit JollibeeVerified(city);
    }

    function deployInfra(string memory city) external onlyArchitect {
        require(cityData[city].hasJollibee, "No Jollibee in this city 😢");
        cityData[city].infraCount += 1;
        emit InfraDeployed(city, cityData[city].infraCount);
    }

    function getCityInfo(string memory city) external view returns (CityStatus memory) {
        return cityData[city];
    }
}
