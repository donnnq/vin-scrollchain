// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthAttendanceRotationAuditGrid {
    address public admin;

    struct RotationEntry {
        string schoolName;
        string region;
        string rotationLayer; // "Half-Day Shifts", "Alternate Weeks", "Modular Schedule"
        uint256 affectedStudents;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    RotationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRotation(string memory schoolName, string memory region, string memory rotationLayer, uint256 affectedStudents, string memory emotionalTag) external onlyAdmin {
        entries.push(RotationEntry(schoolName, region, rotationLayer, affectedStudents, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealRotationEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getRotationEntry(uint256 index) external view returns (RotationEntry memory) {
        return entries[index];
    }
}
