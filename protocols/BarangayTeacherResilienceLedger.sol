// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayTeacherResilienceLedger {
    address public steward;

    struct ResilienceEntry {
        string barangay;
        string teacherSignal;
        string resilienceMechanism;
        string emotionalTag;
    }

    ResilienceEntry[] public ledger;

    event TeacherResilienceTagged(string barangay, string teacherSignal, string resilienceMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory barangay,
        string memory teacherSignal,
        string memory resilienceMechanism,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ResilienceEntry(barangay, teacherSignal, resilienceMechanism, emotionalTag));
        emit TeacherResilienceTagged(barangay, teacherSignal, resilienceMechanism, emotionalTag);
    }
}
