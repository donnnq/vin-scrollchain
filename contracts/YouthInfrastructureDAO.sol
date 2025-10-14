// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthInfrastructureDAO {
    address public admin;

    struct InfraEntry {
        string barangay;
        string facilityType;
        uint256 proposedBudget;
        string emotionalTag;
        bool approved;
    }

    InfraEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _barangay, string memory _facilityType, uint256 _proposedBudget, string memory _emotionalTag) external onlyAdmin {
        registry.push(InfraEntry(_barangay, _facilityType, _proposedBudget, _emotionalTag, false));
    }

    function approveEntry(uint256 index) external onlyAdmin {
        registry[index].approved = true;
    }

    function getEntry(uint256 index) external view returns (InfraEntry memory) {
        return registry[index];
    }
}
