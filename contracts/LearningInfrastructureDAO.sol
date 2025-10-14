// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LearningInfrastructureDAO {
    address public admin;

    struct InfraEntry {
        string purokOrBarangay;
        string facilityType;
        uint256 proposedBudget;
        string emotionalTag;
        bool approved;
    }

    InfraEntry[] public infrastructure;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _purokOrBarangay, string memory _facilityType, uint256 _proposedBudget, string memory _emotionalTag) external onlyAdmin {
        infrastructure.push(InfraEntry(_purokOrBarangay, _facilityType, _proposedBudget, _emotionalTag, false));
    }

    function approveEntry(uint256 index) external onlyAdmin {
        infrastructure[index].approved = true;
    }

    function getEntry(uint256 index) external view returns (InfraEntry memory) {
        return infrastructure[index];
    }
}
