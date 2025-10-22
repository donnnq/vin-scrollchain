// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICISovereignDeploymentGrid {
    address public admin;

    struct DeploymentEntry {
        string sovereignName; // "PGen. Nicolas Torre III"
        string agency; // "PNP", "CIDG", "Imbestigadors"
        string deploymentPurpose; // "Civic audit", "Narrative containment", "Hypocrisy investigation"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    DeploymentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployAgency(string memory sovereignName, string memory agency, string memory deploymentPurpose, string memory emotionalTag) external onlyAdmin {
        entries.push(DeploymentEntry(sovereignName, agency, deploymentPurpose, emotionalTag, true, false));
    }

    function sealDeploymentEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getDeploymentEntry(uint256 index) external view returns (DeploymentEntry memory) {
        return entries[index];
    }
}
