contract vinRebuildCore {
    struct Project {
        string name;
        string structureType;
        uint256 budget;
        bool initiated;
        mapping(string => bool) milestones;
    }

    mapping(string => Project) public projects;
    event HopeConstructed(string siteName);

    function initiateRebuild(string memory _name, string memory _type, uint256 _budget) public {
        projects[_name] = Project(_name, _type, _budget, true);
    }

    function confirmMilestone(string memory _projectName, string memory _milestone) public {
        projects[_projectName].milestones[_milestone] = true;
        emit HopeConstructed(_projectName);
    }
}
