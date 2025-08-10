// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title GlobalPrivilegeMatrix - Ritual scroll for comparing citizen benefits across nations
/// @author Vinvin
/// @notice Tracks wage boosts, discounts, and civic perks for each country

contract GlobalPrivilegeMatrix {
    address public scrollsmith;

    struct Privilege {
        string country;
        uint256 wageBoostPercent;
        uint256 discountRate;
        string civicPerk; // e.g. "Free healthcare", "Subsidized housing"
        uint256 timestamp;
    }

    Privilege[] public privileges;
    mapping(string => Privilege) public privilegeByCountry;

    event PrivilegeLogged(string country, uint256 wageBoost, uint256 discountRate, string civicPerk);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Log or update privilege data for a country
    function logPrivilege(
        string calldata country,
        uint256 wageBoostPercent,
        uint256 discountRate,
        string calldata civicPerk
    ) external onlyScrollsmith {
        privilegeByCountry[country] = Privilege(country, wageBoostPercent, discountRate, civicPerk, block.timestamp);
        privileges.push(privilegeByCountry[country]);
        emit PrivilegeLogged(country, wageBoostPercent, discountRate, civicPerk);
    }

    /// @notice View all privilege entries
    function getAllPrivileges() external view returns (Privilege[] memory) {
        return privileges;
    }

    /// @notice View privilege for a specific country
    function getPrivilege(string calldata country) external view returns (Privilege memory) {
        return privilegeByCountry[country];
    }
}
