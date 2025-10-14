// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicWorksRedemptionProtocolDAO {
    address public admin;

    struct ProjectEntry {
        string projectName;
        string location;
        string repairPlan;
        string emotionalTag;
        bool restored;
    }

    ProjectEntry[] public projects;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProject(string memory _projectName, string memory _location, string memory _repairPlan, string memory _emotionalTag) external onlyAdmin {
        projects.push(ProjectEntry(_projectName, _location, _repairPlan, _emotionalTag, false));
    }

    function markRestored(uint256 index) external onlyAdmin {
        projects[index].restored = true;
    }

    function getProject(uint256 index) external view returns (ProjectEntry memory) {
        return projects[index];
    }
}
