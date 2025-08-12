// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinCivicDashboard {
    struct Project {
        string name;
        string location;
        uint256 budget;
        string status; // e.g., "Planned", "Ongoing", "Completed"
        bool barangayApproved;
    }

    Project[] public projects;

    event ProjectLogged(string name, string location, string status);

    function logProject(
        string memory _name,
        string memory _location,
        uint256 _budget,
        string memory _status,
        bool _barangayApproved
    ) public {
        projects.push(Project(_name, _location, _budget, _status, _barangayApproved));
        emit ProjectLogged(_name, _location, _status);
    }

    function getProject(uint256 index) public view returns (Project memory) {
        return projects[index];
    }

    function totalProjects() public view returns (uint256) {
        return projects.length;
    }
}
