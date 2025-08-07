// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinJoyOverflowRedirector {
    address public deployArchitect;
    uint256 public joyThreshold = 100;

    struct CityJoy {
        uint256 joyUnits;
    }

    mapping(string => CityJoy) public cityJoyMap;

    event JoyRedirected(string fromCity, string toCity, uint256 amount);

    modifier onlyArchitect() {
        require(msg.sender == deployArchitect, "Unauthorized");
        _;
    }

    constructor(address _architect) {
        deployArchitect = _architect;
    }

    function registerCity(string memory city, uint256 initialJoy) external onlyArchitect {
        cityJoyMap[city].joyUnits = initialJoy;
    }

    function redirectOverflow(string memory fromCity, string memory toCity, uint256 amount) external onlyArchitect {
        require(cityJoyMap[fromCity].joyUnits > joyThreshold, "No overflow to redirect");
        require(cityJoyMap[fromCity].joyUnits >= amount, "Insufficient joy");

        cityJoyMap[fromCity].joyUnits -= amount;
        cityJoyMap[toCity].joyUnits += amount;

        emit JoyRedirected(fromCity, toCity, amount);
    }

    function getCityJoy(string memory city) external view returns (uint256) {
        return cityJoyMap[city].joyUnits;
    }
}
