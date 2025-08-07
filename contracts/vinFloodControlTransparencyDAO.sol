pragma solidity ^0.8.20;

contract vinFloodControlTransparencyDAO {
    address public steward;

    struct DredgeProject {
        string location;
        uint256 budget;
        uint256 depthTarget;
        uint256 actualDepth;
        bool citizenVerified;
        string evidenceHash;
    }

    DredgeProject[] public projects;

    event ProjectLogged(string location, uint256 budget);
    event DepthVerified(string location, bool citizenVerified);

    constructor() {
        steward = msg.sender;
    }

    function logProject(
        string memory _location,
        uint256 _budget,
        uint256 _depthTarget,
        uint256 _actualDepth,
        string memory _evidenceHash
    ) public {
        projects.push(DredgeProject(
            _location,
            _budget,
            _depthTarget,
            _actualDepth,
            false,
            _evidenceHash
        ));
        emit ProjectLogged(_location, _budget);
    }

    function verifyDepth(uint256 _index) public {
        require(_index < projects.length, "Invalid project index");
        projects[_index].citizenVerified = true;
        emit DepthVerified(projects[_index].location, true);
    }

    function getProject(uint256 _index) public view returns (DredgeProject memory) {
        require(_index < projects.length, "Invalid project index");
        return projects[_index];
    }
}
