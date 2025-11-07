// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthCryptoLiteracyTrainingManifest {
    address public steward;

    struct TrainingEntry {
        string name;
        string schoolOrBarangay;
        string timestamp;
        string moduleTitle;
        string emotionalTag;
    }

    TrainingEntry[] public manifest;

    event YouthCryptoLiteracyTrained(string name, string schoolOrBarangay, string timestamp, string moduleTitle, string emotionalTag);

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
        emit YouthCryptoLiteracyTrained(name, schoolOrBarangay, timestamp, moduleTitle, emotionalTag);
    }
}
