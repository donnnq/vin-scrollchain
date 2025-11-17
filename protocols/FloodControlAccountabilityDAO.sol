// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FloodControlAccountabilityDAO {
    address public validator;

    struct Project {
        string name;
        uint256 budget;
        string status;
        string consequence;
        uint256 timestamp;
    }

    Project[] public projects;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logProject(string memory _name, uint256 _budget, string memory _status, string memory _consequence) public onlyValidator {
        projects.push(Project(_name, _budget, _status, _consequence, block.timestamp));
    }

    function getProject(uint256 index) public view returns (Project memory) {
        return projects[index];
    }

    function totalProjects() public view returns (uint256) {
        return projects.length;
    }
}
