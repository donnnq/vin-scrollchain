// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinParkPulseProtocol {
    address public ecoAdmin;

    struct GreenZone {
        string barangay;
        uint256 treesPlanted;
        uint256 runningLaneMeters;
        uint256 parkVisits;
    }

    mapping(string => GreenZone) public greenZones;
    string[] public zoneList;

    event GreenZoneUpdated(string barangay);
    modifier onlyAdmin() { require(msg.sender == ecoAdmin, "Restricted"); _; }

    constructor() { ecoAdmin = msg.sender; }

    function registerGreenZone(string memory barangay) public onlyAdmin {
        greenZones[barangay] = GreenZone(barangay, 0, 0, 0);
        zoneList.push(barangay);
    }

    function logUpdate(string memory barangay, uint256 trees, uint256 lanes, uint256 visits) public onlyAdmin {
        GreenZone storage zone = greenZones[barangay];
        zone.treesPlanted += trees;
        zone.runningLaneMeters += lanes;
        zone.parkVisits += visits;
        emit GreenZoneUpdated(barangay);
    }

    function getZone(string memory barangay) public view returns (GreenZone memory) {
        return greenZones[barangay];
    }

    function listZones() public view returns (string[] memory) {
        return zoneList;
    }
}
