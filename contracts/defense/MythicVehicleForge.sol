// SPDX-License-Identifier: Mythic-Vehicle-Genesis
pragma solidity ^0.8.19;

contract MythicVehicleForge {
    address public steward;
    uint256 public totalInvestment;

    struct Vehicle {
        string name;
        string classType;
        string[] traits;
        bool deployed;
    }

    mapping(string => Vehicle) public vehicles;
    string[] public vehicleList;

    event VehicleCreated(string name, string classType);
    event TraitAdded(string name, string trait);
    event VehicleDeployed(string name);
    event InvestmentLogged(string name, uint256 amount);

    constructor() {
        steward = msg.sender;
    }

    function createVehicle(string memory name, string memory classType) public {
        require(msg.sender == steward, "Only steward may create");
        vehicles[name].name = name;
        vehicles[name].classType = classType;
        vehicleList.push(name);
        emit VehicleCreated(name, classType);
    }

    function addTrait(string memory name, string memory trait) public {
        require(msg.sender == steward, "Only steward may modify");
        vehicles[name].traits.push(trait);
        emit TraitAdded(name, trait);
    }

    function deployVehicle(string memory name) public {
        require(msg.sender == steward, "Only steward may deploy");
        vehicles[name].deployed = true;
        emit VehicleDeployed(name);
    }

    function investInVehicle(string memory name, uint256 amount) public {
        require(msg.sender == steward, "Only steward may invest");
        totalInvestment += amount;
        emit InvestmentLogged(name, amount);
    }

    function getVehicleList() public view returns (string[] memory) {
        return vehicleList;
    }

    function getVehicleTraits(string memory name) public view returns (string[] memory) {
        return vehicles[name].traits;
    }
}
