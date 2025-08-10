// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title CountryPrivilege - Ritual scroll for granting economic advantages to verified citizens
/// @author Vinvin
/// @notice Citizens of a country receive benefits like wage boosts, discounts, and priority access

contract CountryPrivilege {
    address public scrollsmith;

    struct Citizen {
        string country;
        address wallet;
        bool isVerified;
    }

    mapping(address => Citizen) public citizens;
    mapping(string => uint256) public wageBoostPercent;
    mapping(string => uint256) public discountRate;

    event CitizenVerified(address wallet, string country);
    event PrivilegeUpdated(string country, uint256 wageBoost, uint256 discountRate);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Verify a citizen by country
    function verifyCitizen(address wallet, string calldata country) external onlyScrollsmith {
        citizens[wallet] = Citizen(country, wallet, true);
        emit CitizenVerified(wallet, country);
    }

    /// @notice Set privilege rates for a country
    function setCountryPrivilege(string calldata country, uint256 wageBoost, uint256 discountRate_) external onlyScrollsmith {
        wageBoostPercent[country] = wageBoost;
        discountRate[country] = discountRate_;
        emit PrivilegeUpdated(country, wageBoost, discountRate_);
    }

    /// @notice Get wage boost for a citizen
    function getWageBoost(address wallet) external view returns (uint256) {
        Citizen memory c = citizens[wallet];
        require(c.isVerified, "Not verified");
        return wageBoostPercent[c.country];
    }

    /// @notice Get discount rate for a citizen
    function getDiscountRate(address wallet) external view returns (uint256) {
        Citizen memory c = citizens[wallet];
        require(c.isVerified, "Not verified");
        return discountRate[c.country];
    }
}
