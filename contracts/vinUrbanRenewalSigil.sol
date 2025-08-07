// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinUrbanRenewalSigil {
    address public admin;

    struct Zone {
        string barangay;
        uint256 tagpiHomesCleared;
        uint256 dignifiedUnitsBuilt;
        bool isBeautified;
    }

    mapping(string => Zone) public renewalZones;
    string[] public zoneList;

    event ZoneUpgraded(string barangay, uint256 unitsBuilt);
    modifier onlyAdmin() { require(msg.sender == admin, "Restricted"); _; }

    constructor() { admin = msg.sender; }

    function registerZone(string memory barangay) public onlyAdmin {
        renewalZones[barangay] = Zone(barangay, 0, 0, false);
        zoneList.push(barangay);
    }

    function markUpgrade(string memory barangay, uint256 cleared, uint256 built) public onlyAdmin {
        Zone storage z = renewalZones[barangay];
        z.tagpiHomesCleared += cleared;
        z.dignifiedUnitsBuilt += built;
        z.isBeautified = true;
        emit ZoneUpgraded(barangay, built);
    }

    function listZones() public view returns (string[] memory) {
        return zoneList;
    }

    function getZone(string memory barangay) public view returns (Zone memory) {
        return renewalZones[barangay];
    }
}
