// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GuardDeploymentToCleanlinessIndex {
    address public steward;

    struct DeploymentEntry {
        string location; // "Pasig Esplanade"
        string guardRole; // "Vendor regulation", "Cleanliness enforcement", "Public safety"
        string deploymentStatus; // "Requested", "Active", "Under review"
        string emotionalTag;
        bool indexed;
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

    function indexDeployment(string memory location, string memory guardRole, string memory deploymentStatus, string memory emotionalTag) external onlySteward {
        entries.push(DeploymentEntry(location, guardRole, deploymentStatus, emotionalTag, true, false));
    }

    function sealDeploymentEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getDeploymentEntry(uint256 index) external view returns (DeploymentEntry memory) {
        return entries[index];
    }
}
