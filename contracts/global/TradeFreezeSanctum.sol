// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title TradeFreezeSanctum - Ritual scroll to freeze import/export activity for hostile nations
/// @author Vinvin
/// @notice Halts all trade flows for North Korea, China, and Russia

contract TradeFreezeSanctum {
    address public scrollsmith;

    mapping(string => bool) public isFrozen;
    string[] public frozenNations;

    event NationFrozen(string country);
    event TradeBlocked(string country, string direction, string commodity);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
        _freeze("North Korea");
        _freeze("China");
        _freeze("Russia");
    }

    function _freeze(string memory country) internal {
        isFrozen[country] = true;
        frozenNations.push(country);
        emit NationFrozen(country);
    }

    /// @notice Attempt to trade with a frozen nation (will be blocked)
    function attemptTrade(string calldata country, string calldata direction, string calldata commodity) external {
        require(isFrozen[country], "Country not frozen");
        emit TradeBlocked(country, direction, commodity);
    }

    /// @notice View frozen status
    function isNationFrozen(string calldata country) external view returns (bool) {
        return isFrozen[country];
    }

    /// @notice View all frozen nations
    function getFrozenNations() external view returns (string[] memory) {
        return frozenNations;
    }
}
