// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JollibeeToGermanyDeploymentGrid {
    address public steward;

    struct DeploymentEntry {
        string city; // "Berlin", "Frankfurt", "Hamburg"
        string deploymentMethod; // "Franchise partnership", "Diaspora petition", "Scrollchain signal"
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

    function deployBranch(string memory city, string memory deploymentMethod, string memory emotionalTag) external onlySteward {
        entries.push(DeploymentEntry(city, deploymentMethod, emotionalTag, true, false));
    }

    function sealDeploymentEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getDeploymentEntry(uint256 index) external view returns (DeploymentEntry memory) {
        return entries[index];
    }
}
