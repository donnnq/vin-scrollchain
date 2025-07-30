// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinCivicPatrolRoster.sol
/// @notice Assigns patrol officers to shifts and zones for continuous civic coverage.

contract vinCivicPatrolRoster {
    address public scrollsmith;

    struct PatrolShift {
        address officer;
        string zone;
        string shiftType; // "Day", "Swing", "Night"
        uint256 startTime;
        uint256 endTime;
    }

    PatrolShift[] public activeShifts;

    event ShiftAssigned(address indexed officer, string zone, string shiftType);
    event ShiftUpdated(address indexed officer, string zone, string shiftType);
    event EmergencyPing(address indexed officer, string zone, string issue);

    constructor() {
        scrollsmith = msg.sender;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Unauthorized scrollsmith");
        _;
    }

    function assignShift(
        address officer,
        string memory zone,
        string memory shiftType,
        uint256 startTime,
        uint256 endTime
    ) public onlyScrollsmith {
        activeShifts.push(PatrolShift(officer, zone, shiftType, startTime, endTime));
        emit ShiftAssigned(officer, zone, shiftType);
    }

    function updateShift(
        uint index,
        string memory newZone,
        string memory newShiftType
    ) public onlyScrollsmith {
        require(index < activeShifts.length, "Invalid shift index");
        activeShifts[index].zone = newZone;
        activeShifts[index].shiftType = newShiftType;
        emit ShiftUpdated(activeShifts[index].officer, newZone, newShiftType);
    }

    function pingEmergency(address officer, string memory zone, string memory issue) public onlyScrollsmith {
        emit EmergencyPing(officer, zone, issue);
    }

    function getShift(uint index) public view returns (PatrolShift memory) {
        require(index < activeShifts.length, "Out of bounds");
        return activeShifts[index];
    }

    function totalShifts() public view returns (uint) {
        return activeShifts.length;
    }
}
