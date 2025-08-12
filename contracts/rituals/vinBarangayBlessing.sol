// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinBarangayBlessing {
    struct Blessing {
        string projectName;
        string barangay;
        bool blessingGiven;
        string ritualNote;
        uint256 timestamp;
    }

    Blessing[] public blessings;

    event BlessingLogged(string projectName, string barangay, bool blessingGiven);

    function logBlessing(
        string memory _projectName,
        string memory _barangay,
        bool _blessingGiven,
        string memory _ritualNote
    ) public {
        blessings.push(Blessing(_projectName, _barangay, _blessingGiven, _ritualNote, block.timestamp));
        emit BlessingLogged(_projectName, _barangay, _blessingGiven);
    }

    function getBlessing(uint256 index) public view returns (Blessing memory) {
        return blessings[index];
    }
}
