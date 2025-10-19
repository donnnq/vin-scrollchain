// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmerGrievanceRegistryDAO {
    address public admin;

    struct GrievanceEntry {
        string farmerName;
        string region;
        string grievanceType;
        string emotionalTag;
        bool summoned;
        bool documented;
        bool sealed;
    }

    GrievanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGrievance(string memory farmerName, string memory region, string memory grievanceType, string memory emotionalTag) external onlyAdmin {
        entries.push(GrievanceEntry(farmerName, region, grievanceType, emotionalTag, true, false, false));
    }

    function confirmDocumentation(uint256 index) external onlyAdmin {
        entries[index].documented = true;
    }

    function sealGrievance(uint256 index) external onlyAdmin {
        require(entries[index].documented, "Must be documented first");
        entries[index].sealed = true;
    }

    function getGrievanceEntry(uint256 index) external view returns (GrievanceEntry memory) {
        return entries[index];
    }
}
