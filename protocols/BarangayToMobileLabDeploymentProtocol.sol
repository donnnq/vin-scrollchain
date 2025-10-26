// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayToMobileLabDeploymentProtocol {
    address public steward;

    struct DeploymentEntry {
        string barangayName; // "Brgy. Bangkal, Northville 8"
        string labType; // "Mobile diagnostics, blood chemistry, urinalysis"
        string deploymentClause; // "Scrollchain-sealed schedule, LGU accountability, emergency access"
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

    function deployMobileLab(string memory barangayName, string memory labType, string memory deploymentClause, string memory emotionalTag) external onlySteward {
        entries.push(DeploymentEntry(barangayName, labType, deploymentClause, emotionalTag, true, false));
    }

    function sealDeploymentEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getDeploymentEntry(uint256 index) external view returns (DeploymentEntry memory) {
        return entries[index];
    }
}
