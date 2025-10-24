// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryDefenseToOrbitalSovereigntyIndex {
    address public steward;

    struct DefenseEntry {
        string missionName; // "DART"
        string targetBody; // "Dimorphos"
        string orbitalImpact; // "Trajectory shift", "Kinetic deflection"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    DefenseEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexDefense(string memory missionName, string memory targetBody, string memory orbitalImpact, string memory emotionalTag) external onlySteward {
        entries.push(DefenseEntry(missionName, targetBody, orbitalImpact, emotionalTag, true, false));
    }

    function sealDefenseEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getDefenseEntry(uint256 index) external view returns (DefenseEntry memory) {
        return entries[index];
    }
}
