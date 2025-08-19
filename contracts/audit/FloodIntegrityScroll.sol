// SPDX-License-Identifier: Civic-Mythic
pragma solidity ^0.8.21;

contract FloodIntegrityScroll {
    struct Project {
        string projectName;
        string location;
        uint256 budget;
        bool isVerified;
        bool isGhostFlagged;
        uint256 timestamp;
    }

    mapping(uint256 => Project) public projects;
    uint256 public projectCount;
    address public steward;

    event ProjectLogged(string name, string location, uint256 budget);
    event GhostFlagged(string name, string location);
    event ProjectVerified(string name, string location);

    constructor(address _steward) {
        steward = _steward;
    }

    function logProject(
        string memory _name,
        string memory _location,
        uint256 _budget
    ) public {
        projects[projectCount] = Project(_name, _location, _budget, false, false, block.timestamp);
        emit ProjectLogged(_name, _location, _budget);
        projectCount++;
    }

    function flagGhost(uint256 _id) public {
        require(_id < projectCount, "Invalid project ID");
        projects[_id].isGhostFlagged = true;
        emit GhostFlagged(projects[_id].projectName, projects[_id].location);
    }

    function verifyProject(uint256 _id) public {
        require(_id < projectCount, "Invalid project ID");
        projects[_id].isVerified = true;
        emit ProjectVerified(projects[_id].projectName, projects[_id].location);
    }

    function getProject(uint256 _id) public view returns (
        string memory name,
        string memory location,
        uint256 budget,
        bool isVerified,
        bool isGhostFlagged,
        uint256 timestamp
    ) {
        Project memory p = projects[_id];
        return (p.projectName, p.location, p.budget, p.isVerified, p.isGhostFlagged, p.timestamp);
    }
}
