// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinBarangayCompleter {
    address public infraAdmin;

    struct BarangayInfra {
        string name;
        bool hasSchool;
        bool hasHealthPost;
        bool hasMarket;
        bool hasPark;
        bool hasTransit;
    }

    mapping(string => BarangayInfra) public infraMap;
    string[] public barangayList;

    event InfraMarked(string name);
    modifier onlyAdmin() { require(msg.sender == infraAdmin, "Restricted"); _; }

    constructor() { infraAdmin = msg.sender; }

    function registerBarangay(string memory name) public onlyAdmin {
        infraMap[name] = BarangayInfra(name, false, false, false, false, false);
        barangayList.push(name);
    }

    function markInfra(string memory name, bool school, bool health, bool market, bool park, bool transit) public onlyAdmin {
        BarangayInfra storage b = infraMap[name];
        b.hasSchool = school;
        b.hasHealthPost = health;
        b.hasMarket = market;
        b.hasPark = park;
        b.hasTransit = transit;
        emit InfraMarked(name);
    }

    function getBarangay(string memory name) public view returns (BarangayInfra memory) {
        return infraMap[name];
    }

    function listAllBarangays() public view returns (string[] memory) {
        return barangayList;
    }
}
