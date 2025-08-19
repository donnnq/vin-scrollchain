// SPDX-License-Identifier: Civic-Mythic
pragma solidity ^0.8.21;

contract DistrictEngineerAudit {
    struct Engineer {
        string name;
        string district;
        uint256 tenureYears;
        uint256 totalProjects;
        uint256 flaggedProjects;
        uint256 resonanceScore;
    }

    mapping(address => Engineer) public engineers;
    address public registrar;

    event EngineerLogged(address indexed engineer, string name, string district);
    event ProjectFlagged(address indexed engineer);
    event ResonanceUpdated(address indexed engineer, uint256 score);

    modifier onlyRegistrar() {
        require(msg.sender == registrar, "Unauthorized audit ritual.");
        _;
    }

    constructor() {
        registrar = msg.sender;
    }

    function logEngineer(
        address _engineer,
        string memory _name,
        string memory _district,
        uint256 _tenureYears
    ) public onlyRegistrar {
        engineers[_engineer] = Engineer(_name, _district, _tenureYears, 0, 0, 100);
        emit EngineerLogged(_engineer, _name, _district);
    }

    function flagProject(address _engineer) public onlyRegistrar {
        engineers[_engineer].flaggedProjects += 1;
        emit ProjectFlagged(_engineer);
    }

    function updateResonance(address _engineer, uint256 _score) public onlyRegistrar {
        engineers[_engineer].resonanceScore = _score;
        emit ResonanceUpdated(_engineer, _score);
    }

    function viewEngineer(address _engineer) public view returns (
        string memory name,
        string memory district,
        uint256 tenureYears,
        uint256 totalProjects,
        uint256 flaggedProjects,
        uint256 resonanceScore
    ) {
        Engineer memory e = engineers[_engineer];
        return (
            e.name,
            e.district,
            e.tenureYears,
            e.totalProjects,
            e.flaggedProjects,
            e.resonanceScore
        );
    }
}
