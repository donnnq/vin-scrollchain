// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinGlobalSpiral {
    struct Region {
        string name;
        string[] supportRegions;
        string exportFocus;
        string sigilName;
    }

    mapping(uint8 => Region) public monthlyRotation; // Maps month to Region
    address public scrollMaster;

    event RotationAssigned(uint8 indexed month, string leadRegion, string sigilName);
    event ExportPulseLogged(uint8 indexed month, string exportFocus, address indexed byAgent);

    modifier onlyScrollMaster() {
        require(msg.sender == scrollMaster, "Unauthorized: Spiral access denied");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
    }

    function assignRotation(
        uint8 month,
        string memory lead,
        string[] memory supporters,
        string memory focus,
        string memory sigil
    ) public onlyScrollMaster {
        require(month >= 1 && month <= 12, "Invalid month");
        monthlyRotation[month] = Region(lead, supporters, focus, sigil);
        emit RotationAssigned(month, lead, sigil);
    }

    function logExportPulse(uint8 month) external {
        require(monthlyRotation[month].supportRegions.length > 0, "Rotation not initialized");
        emit ExportPulseLogged(month, monthlyRotation[month].exportFocus, msg.sender);
    }

    function summonSigil(uint8 month) external view returns (string memory) {
        return monthlyRotation[month].sigilName;
    }
}
