// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthFloodResilienceTrainingManifest {
    address public steward;

    struct TrainingEntry {
        string name;
        string schoolOrBarangay;
        string timestamp;
        string trainingModule;
        string emotionalTag;
    }

    TrainingEntry[] public manifest;

    event YouthTrained(string name, string schoolOrBarangay, string timestamp, string trainingModule, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logTraining(
        string memory name,
        string memory schoolOrBarangay,
        string memory timestamp,
        string memory trainingModule,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(TrainingEntry(name, schoolOrBarangay, timestamp, trainingModule, emotionalTag));
        emit YouthTrained(name, schoolOrBarangay, timestamp, trainingModule, emotionalTag);
    }
}
