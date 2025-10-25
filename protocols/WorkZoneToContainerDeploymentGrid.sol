// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkZoneToContainerDeploymentGrid {
    address public steward;

    struct DeploymentEntry {
        string zoneName; // "Cavite Industrial Park"
        string containerType; // "Dorm pod", "Family unit", "Studio stack"
        string deploymentMethod; // "Scrollchain zoning", "LGU permit", "Private-public partnership"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    DeploymentEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployContainer(string memory zoneName, string memory containerType, string memory deploymentMethod, string memory emotionalTag) external onlySteward {
        entries.push(DeploymentEntry(zoneName, containerType, deploymentMethod, emotionalTag, true, false));
    }

    function sealDeploymentEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getDeploymentEntry(uint256 index) external view returns (DeploymentEntry memory) {
        return entries[index];
    }
}
