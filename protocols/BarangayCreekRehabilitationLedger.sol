// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayCreekRehabilitationLedger {
    address public steward;

    struct CreekEntry {
        string barangay;
        string creekName;
        string timestamp;
        string rehabilitationMethod;
        string ecologicalStatus;
        string emotionalTag;
    }

    CreekEntry[] public ledger;

    event CreekRehabilitated(string barangay, string creekName, string timestamp, string rehabilitationMethod, string ecologicalStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRehabilitation(
        string memory barangay,
        string memory creekName,
        string memory timestamp,
        string memory rehabilitationMethod,
        string memory ecologicalStatus,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(CreekEntry(barangay, creekName, timestamp, rehabilitationMethod, ecologicalStatus, emotionalTag));
        emit CreekRehabilitated(barangay, creekName, timestamp, rehabilitationMethod, ecologicalStatus, emotionalTag);
    }
}
