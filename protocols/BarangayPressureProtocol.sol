// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayPressureProtocol {
    address public admin;

    struct PressureEntry {
        string barangay;
        string escalationType; // "Resolution", "Joint Complaint", "Tank Request"
        string clause;
        string emotionalTag;
        bool summoned;
        bool escalated;
        bool sealed;
    }

    PressureEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPressure(string memory barangay, string memory escalationType, string memory clause, string memory emotionalTag) external onlyAdmin {
        entries.push(PressureEntry(barangay, escalationType, clause, emotionalTag, true, false, false));
    }

    function confirmEscalation(uint256 index) external onlyAdmin {
        entries[index].escalated = true;
    }

    function sealPressureEntry(uint256 index) external onlyAdmin {
        require(entries[index].escalated, "Must be escalated first");
        entries[index].sealed = true;
    }

    function getPressureEntry(uint256 index) external view returns (PressureEntry memory) {
        return entries[index];
    }
}
