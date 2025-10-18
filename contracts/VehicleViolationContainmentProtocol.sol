// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VehicleViolationContainmentProtocol {
    address public admin;

    struct ViolationEntry {
        string plateNumber;
        string location;
        string emotionalTag;
        bool flagged;
        bool validated;
    }

    ViolationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagViolation(string memory plateNumber, string memory location, string memory emotionalTag) external onlyAdmin {
        entries.push(ViolationEntry(plateNumber, location, emotionalTag, true, false));
    }

    function validateViolation(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function getViolationEntry(uint256 index) external view returns (ViolationEntry memory) {
        return entries[index];
    }
}
