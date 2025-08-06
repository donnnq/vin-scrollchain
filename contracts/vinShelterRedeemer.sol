// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinShelterRedeemer
/// @dev Acquires subdivisions and assigns shelter for displaced or homeless citizens

contract vinShelterRedeemer {
    address public housingAdmin;

    struct Subdivision {
        string name;
        uint256 availableUnits;
        bool isPurchased;
    }

    struct Citizen {
        address wallet;
        string fullName;
        bool isDisplaced;
        bool isUnhoused;
        bool hasReceivedUnit;
    }

    mapping(string => Subdivision) public subdivisions;
    mapping(address => Citizen) public citizens;
    string[] public subdivisionList;
    address[] public citizenList;

    event SubdivisionBought(string name, uint256 units);
    event CitizenRegistered(address wallet, string name, bool isDisplaced);
    event UnitAssigned(address wallet, string subdivision);

    modifier onlyAdmin() {
        require(msg.sender == housingAdmin, "Unauthorized");
        _;
    }

    constructor() {
        housingAdmin = msg.sender;
    }

    function purchaseSubdivision(string memory name, uint256 units) public onlyAdmin {
        subdivisions[name] = Subdivision(name, units, true);
        subdivisionList.push(name);
        emit SubdivisionBought(name, units);
    }

    function registerCitizen(address wallet, string memory name, bool displacedStatus) public onlyAdmin {
        bool isUnhoused = true;
        citizens[wallet] = Citizen(wallet, name, displacedStatus, isUnhoused, false);
        citizenList.push(wallet);
        emit CitizenRegistered(wallet, name, displacedStatus);
    }

    function assignUnit(address wallet, string memory subdivisionName) public onlyAdmin {
        Subdivision storage subd = subdivisions[subdivisionName];
        Citizen storage c = citizens[wallet];

        require(subd.isPurchased, "Subdivision not available");
        require(subd.availableUnits > 0, "No units left");
        require(!c.hasReceivedUnit, "Already assigned");

        subd.availableUnits -= 1;
        c.hasReceivedUnit = true;
        c.isUnhoused = false;

        emit UnitAssigned(wallet, subdivisionName);
    }

    function getCitizen(address wallet) public view returns (Citizen memory) {
        return citizens[wallet];
    }

    function getSubdivision(string memory name) public view returns (Subdivision memory) {
        return subdivisions[name];
    }

    function listAllCitizens() public view returns (address[] memory) {
        return citizenList;
    }

    function listAllSubdivisions() public view returns (string[] memory) {
        return subdivisionList;
    }
}
