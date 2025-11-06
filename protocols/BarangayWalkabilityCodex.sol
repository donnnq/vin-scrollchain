// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayWalkabilityCodex {
    address public steward;

    struct WalkabilityEntry {
        string barangay;
        string pedestrianInfrastructure;
        string walkabilityScore;
        string emotionalTag;
    }

    WalkabilityEntry[] public codex;

    event WalkabilityTagged(string barangay, string pedestrianInfrastructure, string walkabilityScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagWalkability(
        string memory barangay,
        string memory pedestrianInfrastructure,
        string memory walkabilityScore,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(WalkabilityEntry(barangay, pedestrianInfrastructure, walkabilityScore, emotionalTag));
        emit WalkabilityTagged(barangay, pedestrianInfrastructure, walkabilityScore, emotionalTag);
    }
}
