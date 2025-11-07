// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthDAOValidatorTrainingManifest {
    address public steward;

    struct TrainingEntry {
        string name;
        string schoolOrBarangay;
        string timestamp;
        string moduleTitle;
        string emotionalTag;
    }

    TrainingEntry[] public manifest;

    event YouthValidatorTrained(string name, string schoolOrBarangay, string timestamp, string moduleTitle, string emotionalTag);

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
        string memory moduleTitle,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(TrainingEntry(name, schoolOrBarangay, timestamp, moduleTitle, emotionalTag));
        emit YouthValidatorTrained(name, schoolOrBarangay, timestamp, moduleTitle, emotionalTag);
    }
}
