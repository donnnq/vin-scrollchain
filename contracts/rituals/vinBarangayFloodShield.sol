// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinBarangayFloodShield {
    struct AidDrop {
        string barangay;
        string aidType;
        uint256 quantity;
        string ritualNote;
        uint256 timestamp;
    }

    AidDrop[] public aidLog;

    event AidDeployed(string barangay, string aidType, uint256 quantity);

    function deployAid(
        string memory _barangay,
        string memory _aidType,
        uint256 _quantity,
        string memory _ritualNote
    ) public {
        aidLog.push(AidDrop(_barangay, _aidType, _quantity, _ritualNote, block.timestamp));
        emit AidDeployed(_barangay, _aidType, _quantity);
    }

    function getAidDrop(uint256 index) public view returns (AidDrop memory) {
        return aidLog[index];
    }
}
