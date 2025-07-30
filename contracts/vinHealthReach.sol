// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinHealthReach {
    struct Clinic {
        string county;
        bool isTelehealthReady;
        bool isMobileUnitLinked;
    }

    Clinic[] public deployedClinics;

    function deployClinic(string memory county, bool tele, bool mobile) public {
        deployedClinics.push(Clinic(county, tele, mobile));
    }

    function getClinic(uint index) public view returns (Clinic memory) {
        require(index < deployedClinics.length, "Invalid index");
        return deployedClinics[index];
    }
}
