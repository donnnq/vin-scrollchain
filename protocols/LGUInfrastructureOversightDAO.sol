// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LGUInfrastructureOversightDAO {
    address public admin;

    struct ProjectEntry {
        string projectName;
        string lguUnit;
        string emotionalTag;
        bool summoned;
        bool approved;
        bool sealed;
    }

    ProjectEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProject(string memory projectName, string memory lguUnit, string memory emotionalTag) external onlyAdmin {
        entries.push(ProjectEntry(projectName, lguUnit, emotionalTag, true, false, false));
    }

    function approveProject(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function sealProject(uint256 index) external onlyAdmin {
        require(entries[index].approved, "Must be approved first");
        entries[index].sealed = true;
    }

    function getProjectEntry(uint256 index) external view returns (ProjectEntry memory) {
        return entries[index];
    }
}
