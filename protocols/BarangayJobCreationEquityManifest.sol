// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayJobCreationEquityManifest {
    address public steward;

    struct JobEntry {
        string timestamp;
        string barangay;
        string industryFocus;
        string cooperativeModel;
        string youthSTEMProgram;
        string emotionalTag;
    }

    JobEntry[] public manifest;

    event JobCreationManifested(string timestamp, string barangay, string industryFocus, string cooperativeModel, string youthSTEMProgram, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function manifestJobCreation(
        string memory timestamp,
        string memory barangay,
        string memory industryFocus,
        string memory cooperativeModel,
        string memory youthSTEMProgram,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(JobEntry(timestamp, barangay, industryFocus, cooperativeModel, youthSTEMProgram, emotionalTag));
        emit JobCreationManifested(timestamp, barangay, industryFocus, cooperativeModel, youthSTEMProgram, emotionalTag);
    }
}
