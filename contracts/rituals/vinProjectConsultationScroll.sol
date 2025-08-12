// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinProjectConsultationScroll {
    address public mayor;
    uint256 public projectCount;

    struct Project {
        string projectName;
        string location;
        string description;
        bool approvedByMayor;
        uint256 progressPercent;
        string statusNote;
    }

    mapping(uint256 => Project) public projects;

    event ProjectSubmitted(string projectName, string location);
    event MayorApproval(uint256 projectId, bool approved);
    event ProgressUpdated(uint256 projectId, uint256 progressPercent, string statusNote);

    constructor(address _mayor) {
        mayor = _mayor;
    }

    modifier onlyMayor() {
        require(msg.sender == mayor, "Only the mayor can perform this action.");
        _;
    }

    function submitProject(
        string memory _projectName,
        string memory _location,
        string memory _description
    ) public {
        projects[projectCount] = Project(_projectName, _location, _description, false, 0, "Pending approval");
        emit ProjectSubmitted(_projectName, _location);
        projectCount++;
    }

    function approveProject(uint256 _projectId, bool _approved) public onlyMayor {
        projects[_projectId].approvedByMayor = _approved;
        emit MayorApproval(_projectId, _approved);
    }

    function updateProgress(uint256 _projectId, uint256 _progressPercent, string memory _statusNote) public {
        require(projects[_projectId].approvedByMayor, "Project not yet approved by mayor.");
        projects[_projectId].progressPercent = _progressPercent;
        projects[_projectId].statusNote = _statusNote;
        emit ProgressUpdated(_projectId, _progressPercent, _statusNote);
    }
}
