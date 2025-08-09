// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title GlobalSanctumSuite — Soulbound aid module for global restoration
/// @author Vinvin
/// @notice Dispenses encrypted blessings to nations in need

contract GlobalSanctumSuite {
    address public scrollsmith;
    uint256 public totalSanctum = 100_000_000_000 * 1e18; // $100B global fund
    mapping(string => address) public nationVault;
    mapping(string => uint256) public nationBlessing;
    mapping(string => string) public nationMessage;

    event SanctumDeployed(string indexed nation, address vault, uint256 amount, string message);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Deploy sanctum to a nation
    function deploySanctum(string calldata nation, address vault, uint256 amount, string calldata message) external onlyScrollsmith {
        require(nationVault[nation] == address(0), "Sanctum already deployed");
        require(amount <= totalSanctum, "Exceeds global fund");

        nationVault[nation] = vault;
        nationBlessing[nation] = amount;
        nationMessage[nation] = message;
        totalSanctum -= amount;

        emit SanctumDeployed(nation, vault, amount, message);
    }

    /// @notice View remaining global fund
    function remainingSanctum() external view returns (uint256) {
        return totalSanctum;
    }

    /// @notice Get nation blessing details
    function getNationSanctum(string calldata nation) external view returns (address vault, uint256 amount, string memory message) {
        return (nationVault[nation], nationBlessing[nation], nationMessage[nation]);
    }
}
