// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MedicalDignityTribunal {
    address public admin;

    struct TribunalEntry {
        string patientName;
        string facility;
        string grievanceType;
        string emotionalTag;
        bool heard;
        bool resolved;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitGrievance(string memory patientName, string memory facility, string memory grievanceType, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(patientName, facility, grievanceType, emotionalTag, false, false));
    }

    function markHeard(uint256 index) external onlyAdmin {
        entries[index].heard = true;
    }

    function markResolved(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getGrievance(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
