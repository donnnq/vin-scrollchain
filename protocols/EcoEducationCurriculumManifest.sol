// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EcoEducationCurriculumManifest {
    address public steward;

    struct CurriculumModule {
        string gradeLevel;
        string moduleTitle;
        string timestamp;
        string integrationStatus;
        string emotionalTag;
    }

    CurriculumModule[] public manifest;

    event EcoModuleIntegrated(string gradeLevel, string moduleTitle, string timestamp, string integrationStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function integrateModule(
        string memory gradeLevel,
        string memory moduleTitle,
        string memory timestamp,
        string memory integrationStatus,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(CurriculumModule(gradeLevel, moduleTitle, timestamp, integrationStatus, emotionalTag));
        emit EcoModuleIntegrated(gradeLevel, moduleTitle, timestamp, integrationStatus, emotionalTag);
    }
}
