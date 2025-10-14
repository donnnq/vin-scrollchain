// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProofOfWorkInfrastructureDAO {
    address public admin;

    struct InfrastructureEntry {
        string facilityName;
        string energySource;
        string operationalTier;
        string emotionalTag;
        bool validated;
    }

    InfrastructureEntry[] public infrastructure;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerFacility(string memory _facilityName, string memory _energySource, string memory _operationalTier, string memory _emotionalTag) external onlyAdmin {
        infrastructure.push(InfrastructureEntry(_facilityName, _energySource, _operationalTier, _emotionalTag, false));
    }

    function validateFacility(uint256 index) external onlyAdmin {
        infrastructure[index].validated = true;
    }

    function getFacility(uint256 index) external view returns (InfrastructureEntry memory) {
        return infrastructure[index];
    }
}
