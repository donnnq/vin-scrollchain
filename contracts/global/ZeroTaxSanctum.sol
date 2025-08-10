// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ZeroTaxSanctum - A sovereign scroll for tax-free civic zones
contract ZeroTaxSanctum {
    address public sanctumKeeper;
    mapping(address => bool) public sanctumCitizens;
    string public sanctumDecree = "Within this sanctum, no citizen shall be taxed.";

    event SanctumEntered(address indexed citizen);
    event SanctumRevoked(address indexed citizen);

    modifier onlyKeeper() {
        require(msg.sender == sanctumKeeper, "Not the sanctum keeper.");
        _;
    }

    constructor() {
        sanctumKeeper = msg.sender;
    }

    /// @notice Grants zero-tax status to a citizen
    function enterSanctum(address _citizen) external onlyKeeper {
        sanctumCitizens[_citizen] = true;
        emit SanctumEntered(_citizen);
    }

    /// @notice Revokes zero-tax status
    function revokeSanctum(address _citizen) external onlyKeeper {
        sanctumCitizens[_citizen] = false;
        emit SanctumRevoked(_citizen);
    }

    /// @notice Checks if an address is protected by the sanctum
    function isSanctumCitizen(address _citizen) external view returns (bool) {
        return sanctumCitizens[_citizen];
    }

    /// @notice Returns the sanctum decree
    function readDecree() external view returns (string memory) {
        return sanctumDecree;
    }
}
