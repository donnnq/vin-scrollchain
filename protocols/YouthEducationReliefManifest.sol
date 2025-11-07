// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthEducationReliefManifest {
    address public steward;

    struct ReliefEntry {
        string timestamp;
        string barangay;
        string supportType;
        string digitalAccessLevel;
        string emotionalTag;
    }

    ReliefEntry[] public manifest;

    event EducationReliefManifested(string timestamp, string barangay, string supportType, string digitalAccessLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function manifestRelief(
        string memory timestamp,
        string memory barangay,
        string memory supportType,
        string memory digitalAccessLevel,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(ReliefEntry(timestamp, barangay, supportType, digitalAccessLevel, emotionalTag));
        emit EducationReliefManifested(timestamp, barangay, supportType, digitalAccessLevel, emotionalTag);
    }
}
