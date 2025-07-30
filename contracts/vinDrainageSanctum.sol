// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinDrainageSanctum.sol
/// @notice Tracks flood-prone zones and civic drainage upgrades

contract vinDrainageSanctum {
    address public planner;
    uint public zoneCount;

    struct DrainageZone {
        string name;
        string issueLog;
        bool needsUpgrade;
        uint rainfallLog; // in mm
        uint timestamp;
    }

    mapping(uint => DrainageZone) public zoneRegistry;

    event ZoneRegistered(string name, string issueLog);
    event UpgradeFlagged(string name);
    event UpgradeResolved(string name);

    constructor() {
        planner = msg.sender;
    }

    modifier onlyPlanner() {
        require(msg.sender == planner, "Unauthorized");
        _;
    }

    function registerZone(string memory name, string memory issueLog, uint rainfallLog, bool needsUpgrade) public onlyPlanner {
        zoneRegistry[zoneCount++] = DrainageZone(name, issueLog, needsUpgrade, rainfallLog, block.timestamp);
        emit ZoneRegistered(name, issueLog);
        if (needsUpgrade) emit UpgradeFlagged(name);
    }

    function resolveUpgrade(uint zoneId) public onlyPlanner {
        require(zoneId < zoneCount, "Invalid zone");
        zoneRegistry[zoneId].needsUpgrade = false;
        emit UpgradeResolved(zoneRegistry[zoneId].name);
    }

    function getZone(uint zoneId) public view returns (DrainageZone memory) {
        require(zoneId < zoneCount, "Invalid zone");
        return zoneRegistry[zoneId];
    }
}
