// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinSubdivisionRefurbisher
/// @dev Restores and upgrades housing units in legacy subdivisions

contract vinSubdivisionRefurbisher {
    address public refurbAdmin;

    struct Zone {
        string name;
        uint256 unitsToRefurbish;
        uint256 unitsCompleted;
        bool isActive;
    }

    mapping(string => Zone) public zones;
    string[] public zoneList;

    event ZoneRegistered(string name, uint256 units);
    event UnitUpgraded(string name, uint256 newTotal);

    modifier onlyAdmin() {
        require(msg.sender == refurbAdmin, "Unauthorized");
        _;
    }

    constructor() {
        refurbAdmin = msg.sender;
    }

    function registerZone(string memory name, uint256 units) public onlyAdmin {
        zones[name] = Zone(name, units, 0, true);
        zoneList.push(name);
        emit ZoneRegistered(name, units);
    }

    function markUnitUpgrade(string memory name, uint256 count) public onlyAdmin {
        Zone storage z = zones[name];
        require(z.isActive, "Zone inactive");
        z.unitsCompleted += count;
        emit UnitUpgraded(name, z.unitsCompleted);
    }

    function getZoneProgress(string memory name) public view returns (Zone memory) {
        return zones[name];
    }

    function listZones() public view returns (string[] memory) {
        return zoneList;
    }
}
