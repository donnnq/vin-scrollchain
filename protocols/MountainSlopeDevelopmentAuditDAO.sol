// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MountainSlopeDevelopmentAuditDAO {
    address public validator;

    struct ProjectAudit {
        string projectName;
        string location;
        string riskLevel;
        string communityImpact;
        uint256 timestamp;
    }

    ProjectAudit[] public audits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logAudit(string memory _projectName, string memory _location, string memory _riskLevel, string memory _impact) public onlyValidator {
        audits.push(ProjectAudit(_projectName, _location, _riskLevel, _impact, block.timestamp));
    }

    function getAudit(uint256 index) public view returns (ProjectAudit memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
