// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateAlignedInfrastructureDAO {
    address public admin;

    struct InfrastructureEntry {
        string projectName;
        string region;
        string climateGoal;
        string emotionalTag;
        bool summoned;
        bool aligned;
        bool sealed;
    }

    InfrastructureEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonInfrastructure(string memory projectName, string memory region, string memory climateGoal, string memory emotionalTag) external onlyAdmin {
        entries.push(InfrastructureEntry(projectName, region, climateGoal, emotionalTag, true, false, false));
    }

    function alignInfrastructure(uint256 index) external onlyAdmin {
        entries[index].aligned = true;
    }

    function sealInfrastructure(uint256 index) external onlyAdmin {
        require(entries[index].aligned, "Must be aligned first");
        entries[index].sealed = true;
    }

    function getInfrastructureEntry(uint256 index) external view returns (InfrastructureEntry memory) {
        return entries[index];
    }
}
