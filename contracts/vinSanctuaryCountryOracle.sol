// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinSanctuaryCountryOracle {
    address public oracleMaster;

    struct CountryProfile {
        string name;
        uint8 safetyScore;       // 0–100
        uint8 stabilityScore;    // 0–100
        uint8 civicTrustScore;   // 0–100
    }

    mapping(string => CountryProfile) public countryData;
    string[] public countryList;

    modifier onlyMaster() {
        require(msg.sender == oracleMaster, "Unauthorized");
        _;
    }

    constructor(address _master) {
        oracleMaster = _master;
    }

    function updateCountryProfile(
        string memory name,
        uint8 safety,
        uint8 stability,
        uint8 civicTrust
    ) external onlyMaster {
        countryData[name] = CountryProfile(name, safety, stability, civicTrust);
        countryList.push(name);
    }

    function getCountryScore(string memory name) external view returns (uint256 totalScore) {
        CountryProfile memory c = countryData[name];
        return uint256(c.safetyScore + c.stabilityScore + c.civicTrustScore);
    }

    function getAllCountries() external view returns (string[] memory) {
        return countryList;
    }
}
