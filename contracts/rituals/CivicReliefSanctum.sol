// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title CivicReliefSanctum — Soulbound relief module for fuel, water, electricity, and food
/// @author Vinvin
/// @notice Dispenses monthly subsidies to verified citizens (e.g. tricycle drivers, low-income households)

contract CivicReliefSanctum {
    address public scrollsmith;

    struct Relief {
        uint256 fuel;
        uint256 water;
        uint256 electricity;
        uint256 food;
        uint256 lastClaim;
    }

    mapping(address => bool) public isBeneficiary;
    mapping(address => Relief) public reliefLedger;

    event ReliefClaimed(address indexed soul, uint256 fuel, uint256 water, uint256 electricity, uint256 food);

    modifier onlyBeneficiary() {
        require(isBeneficiary[msg.sender], "Not registered");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Register a soul for monthly relief
    function registerSoul(address soul) external {
        require(msg.sender == scrollsmith, "Only scrollsmith");
        isBeneficiary[soul] = true;
    }

    /// @notice Claim monthly relief
    function claimRelief() external onlyBeneficiary {
        Relief storage r = reliefLedger[msg.sender];
        require(block.timestamp - r.lastClaim >= 30 days, "Wait for next cycle");

        r.fuel = 1500 * 1e18;        // ₱1500 fuel
        r.water = 500 * 1e18;        // ₱500 water
        r.electricity = 1000 * 1e18; // ₱1000 electricity
        r.food = 2000 * 1e18;        // ₱2000 food
        r.lastClaim = block.timestamp;

        emit ReliefClaimed(msg.sender, r.fuel, r.water, r.electricity, r.food);
    }

    /// @notice View current relief values
    function getRelief(address soul) external view returns (uint256 fuel, uint256 water, uint256 electricity, uint256 food, uint256 lastClaim) {
        Relief memory r = reliefLedger[soul];
        return (r.fuel, r.water, r.electricity, r.food, r.lastClaim);
    }
}
