// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

contract YouthReformBlessing {
    address public steward;
    mapping(string => bool) public cityBlessed;
    mapping(string => uint256) public facilityFund;
    mapping(string => string[]) public resourceDrop;

    event CityBlessed(string indexed city, uint256 fundAmount, string[] resources);
    event ReformVow(string indexed city, string vow);

    constructor() {
        steward = msg.sender;
    }

    function blessCity(string memory city, uint256 fundAmount, string[] memory resources) public {
        require(msg.sender == steward, "Only steward can bless");
        require(!cityBlessed[city], "City already blessed");

        cityBlessed[city] = true;
        facilityFund[city] = fundAmount;
        resourceDrop[city] = resources;

        emit CityBlessed(city, fundAmount, resources);
    }

    function declareVow(string memory city, string memory vow) public {
        require(cityBlessed[city], "City not yet blessed");
        emit ReformVow(city, vow);
    }

    function getResources(string memory city) public view returns (string[] memory) {
        return resourceDrop[city];
    }

    function getFund(string memory city) public view returns (uint256) {
        return facilityFund[city];
    }
}
