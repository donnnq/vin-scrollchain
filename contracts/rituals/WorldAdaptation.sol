// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title WorldAdaptation - Ritual scroll for tracking World App expansion and restriction zones
/// @author Vinvin
/// @notice Encodes Orb deployments, restriction zones, and mythic access thresholds

contract WorldAdaptation {
    address public scrollsmith;
    uint256 public orbCount;
    mapping(string => bool) public restrictedCountries;
    mapping(string => bool) public orbDeployed;
    mapping(string => uint256) public accessThreshold;

    event OrbDeployed(string indexed country, uint256 timestamp);
    event CountryRestricted(string indexed country);
    event ThresholdSet(string indexed country, uint256 level);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Deploy an Orb to a country
    function deployOrb(string memory country) external onlyScrollsmith {
        require(!orbDeployed[country], "Orb already deployed");
        orbDeployed[country] = true;
        orbCount++;
        emit OrbDeployed(country, block.timestamp);
    }

    /// @notice Restrict a country from full access
    function restrictCountry(string memory country) external onlyScrollsmith {
        restrictedCountries[country] = true;
        emit CountryRestricted(country);
    }

    /// @notice Set symbolic access threshold for a country
    function setAccessThreshold(string memory country, uint256 level) external onlyScrollsmith {
        accessThreshold[country] = level;
        emit ThresholdSet(country, level);
    }

    /// @notice Check if a country is eligible for full World App access
    function isEligible(string memory country, uint256 userLevel) external view returns (bool) {
        if (restrictedCountries[country]) return false;
        return userLevel >= accessThreshold[country];
    }
}
