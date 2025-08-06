// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinChickenJoyYieldTracker {
    address public deployArchitect;

    struct CityJoy {
        uint256 infraCount;
        uint256 totalJoyUnits;
    }

    mapping(string => CityJoy) public joyMap;

    event JoyYielded(string city, uint256 joyUnits, uint256 totalJoy);

    modifier onlyArchitect() {
        require(msg.sender == deployArchitect, "Unauthorized");
        _;
    }

    constructor(address _architect) {
        deployArchitect = _architect;
    }

    function deployWithJoy(string memory city, uint256 joyUnits) external onlyArchitect {
        CityJoy storage cj = joyMap[city];
        cj.infraCount += 1;
        cj.totalJoyUnits += joyUnits;

        emit JoyYielded(city, joyUnits, cj.totalJoyUnits);
    }

    function getCityJoy(string memory city) external view returns (CityJoy memory) {
        return joyMap[city];
    }

    function getJoyPerInfra(string memory city) external view returns (uint256) {
        CityJoy memory cj = joyMap[city];
        if (cj.infraCount == 0) return 0;
        return cj.totalJoyUnits / cj.infraCount;
    }
}
