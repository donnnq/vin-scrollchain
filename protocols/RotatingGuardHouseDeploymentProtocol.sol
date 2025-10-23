// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RotatingGuardHouseDeploymentProtocol {
    address public steward;

    struct GuardHouseEntry {
        string location; // "Pasig Esplanade"
        string rotationZone; // "Northwalk", "Food stall corridor", "Riverfront"
        string deploymentType; // "Compact booth", "Mobile post"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    GuardHouseEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployGuardHouse(string memory location, string memory rotationZone, string memory deploymentType, string memory emotionalTag) external onlySteward {
        entries.push(GuardHouseEntry(location, rotationZone, deploymentType, emotionalTag, true, false));
    }

    function sealGuardHouseEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getGuardHouseEntry(uint256 index) external view returns (GuardHouseEntry memory) {
        return entries[index];
    }
}
