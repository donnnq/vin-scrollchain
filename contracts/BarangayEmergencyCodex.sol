// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayEmergencyCodex {
    address public admin;

    struct EmergencyEntry {
        string barangayName;
        string emergencyType;
        string emotionalTag;
        bool activated;
        bool resolved;
    }

    EmergencyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function activateEmergency(string memory barangayName, string memory emergencyType, string memory emotionalTag) external onlyAdmin {
        entries.push(EmergencyEntry(barangayName, emergencyType, emotionalTag, true, false));
    }

    function resolveEmergency(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getEmergencyEntry(uint256 index) external view returns (EmergencyEntry memory) {
        return entries[index];
    }
}
