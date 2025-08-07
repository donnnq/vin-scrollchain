// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinWasteCommandCenter
/// @dev Governs regional waste zones, dispatches teams, tracks cleanup status

contract vinWasteCommandCenter {
    address public chiefOfficer;

    struct WasteZone {
        string zoneName;
        bool isActive;
        bool weeklyHakotScheduled;
        bool hasTeamAssigned;
        uint256 cleanupScore;
    }

    mapping(string => WasteZone) public zones;
    string[] public zoneList;

    event ZoneRegistered(string zoneName);
    event TeamAssigned(string zoneName);
    event HakotScheduled(string zoneName);
    event CleanupAudited(string zoneName, uint256 score);

    modifier onlyChief() {
        require(msg.sender == chiefOfficer, "Only Chief Officer can execute");
        _;
    }

    constructor() {
        chiefOfficer = msg.sender;
    }

    function registerZone(string memory name) public onlyChief {
        zones[name] = WasteZone(name, true, false, false, 0);
        zoneList.push(name);
        emit ZoneRegistered(name);
    }

    function assignCleanupTeam(string memory name) public onlyChief {
        zones[name].hasTeamAssigned = true;
        emit TeamAssigned(name);
    }

    function scheduleWeeklyHakot(string memory name) public onlyChief {
        zones[name].weeklyHakotScheduled = true;
        emit HakotScheduled(name);
    }

    function auditCleanup(string memory name, uint256 score) public onlyChief {
        require(score <= 100, "Max score is 100");
        zones[name].cleanupScore = score;
        emit CleanupAudited(name, score);
    }

    function getZoneStatus(string memory name) public view returns (WasteZone memory) {
        return zones[name];
    }

    function listZones() public view returns (string[] memory) {
        return zoneList;
    }
}
