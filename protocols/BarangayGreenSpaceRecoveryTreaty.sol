// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayGreenSpaceRecoveryTreaty {
    address public steward;

    struct RecoveryEntry {
        string barangay;
        string timestamp;
        string restorationMethod;
        string agencyInvolved;
        string emotionalTag;
    }

    RecoveryEntry[] public treaty;

    event GreenSpaceRecovered(string barangay, string timestamp, string restorationMethod, string agencyInvolved, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function recoverGreenSpace(
        string memory barangay,
        string memory timestamp,
        string memory restorationMethod,
        string memory agencyInvolved,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(RecoveryEntry(barangay, timestamp, restorationMethod, agencyInvolved, emotionalTag));
        emit GreenSpaceRecovered(barangay, timestamp, restorationMethod, agencyInvolved, emotionalTag);
    }
}
