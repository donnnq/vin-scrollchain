// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinWasteFleetManager
/// @dev Manages smart trucks, driver wages, and barangay collection schedules

contract vinWasteFleetManager {
    address public fleetAdmin;
    uint256 public baseWagePerDay = 0.05 ether;

    struct Truck {
        string id;
        string model;
        bool isOperational;
        string currentBarangay;
        uint256 fuelEfficiencyScore;
    }

    struct Driver {
        address wallet;
        string name;
        uint256 daysWorked;
        uint256 totalWage;
    }

    string[] public scheduleBarangays;
    Truck[] public trucks;
    mapping(address => Driver) public driverRecords;

    event TruckDeployed(string indexed truckId, string toBarangay);
    event WagePaid(address indexed driver, uint256 amount);
    event BinPolicyActivated(string decree);

    modifier onlyFleetAdmin() {
        require(msg.sender == fleetAdmin, "Only admin");
        _;
    }

    constructor() {
        fleetAdmin = msg.sender;
    }

    function registerTruck(string memory id, string memory model) public onlyFleetAdmin {
        trucks.push(Truck(id, model, true, "", 100));
    }

    function assignSchedule(string[] memory barangays) public onlyFleetAdmin {
        scheduleBarangays = barangays;
    }

    function deployTruck(uint256 truckIndex, uint256 barangayIndex) public onlyFleetAdmin {
        Truck storage t = trucks[truckIndex];
        string memory barangay = scheduleBarangays[barangayIndex];
        t.currentBarangay = barangay;
        emit TruckDeployed(t.id, barangay);
    }

    function logDriverWork(address driverWallet, string memory name) public onlyFleetAdmin {
        Driver storage d = driverRecords[driverWallet];
        d.name = name;
        d.daysWorked += 1;
        uint256 wage = baseWagePerDay;
        d.totalWage += wage;
        emit WagePaid(driverWallet, wage);
    }

    function activateBinDecree(string memory decreeText) public onlyFleetAdmin {
        emit BinPolicyActivated(decreeText);
    }

    function viewTruck(uint256 index) public view returns (Truck memory) {
        return trucks[index];
    }

    function viewDriver(address wallet) public view returns (Driver memory) {
        return driverRecords[wallet];
    }
}
