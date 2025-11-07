// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayMediaLiteracyTrainingManifest {
    address public steward;

    struct TrainingEntry {
        string barangay;
        string timestamp;
        string moduleTitle;
        string trainerName;
        string emotionalTag;
    }

    TrainingEntry[] public manifest;

    event MediaLiteracyTrained(string barangay, string timestamp, string moduleTitle, string trainerName, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logTraining(
        string memory barangay,
        string memory timestamp,
        string memory moduleTitle,
        string memory trainerName,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(TrainingEntry(barangay, timestamp, moduleTitle, trainerName, emotionalTag));
        emit MediaLiteracyTrained(barangay, timestamp, moduleTitle, trainerName, emotionalTag);
    }
}
