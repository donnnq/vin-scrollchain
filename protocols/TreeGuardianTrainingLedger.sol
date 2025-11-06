// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreeGuardianTrainingLedger {
    address public steward;

    struct TrainingEntry {
        string guardianName;
        string barangay;
        string trainingProtocol;
        string emotionalTag;
    }

    TrainingEntry[] public ledger;

    event TreeGuardianTrained(string guardianName, string barangay, string trainingProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function trainGuardian(
        string memory guardianName,
        string memory barangay,
        string memory trainingProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(TrainingEntry(guardianName, barangay, trainingProtocol, emotionalTag));
        emit TreeGuardianTrained(guardianName, barangay, trainingProtocol, emotionalTag);
    }
}
