// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangaySTEMCurriculumDAO {
    address public steward;

    struct CurriculumEntry {
        string barangay;
        string STEMModule;
        string deploymentMechanism;
        string emotionalTag;
    }

    CurriculumEntry[] public registry;

    event STEMCurriculumTagged(string barangay, string STEMModule, string deploymentMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCurriculum(
        string memory barangay,
        string memory STEMModule,
        string memory deploymentMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(CurriculumEntry(barangay, STEMModule, deploymentMechanism, emotionalTag));
        emit STEMCurriculumTagged(barangay, STEMModule, deploymentMechanism, emotionalTag);
    }
}
