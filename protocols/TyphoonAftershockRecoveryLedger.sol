// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TyphoonAftershockRecoveryLedger {
    address public steward;

    struct RecoveryEntry {
        string region;
        string timestamp;
        string recoveryPhase;
        string resourceStatus;
        string emotionalTag;
    }

    RecoveryEntry[] public ledger;

    event RecoveryLogged(string region, string timestamp, string recoveryPhase, string resourceStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRecovery(
        string memory region,
        string memory timestamp,
        string memory recoveryPhase,
        string memory resourceStatus,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(RecoveryEntry(region, timestamp, recoveryPhase, resourceStatus, emotionalTag));
        emit RecoveryLogged(region, timestamp, recoveryPhase, resourceStatus, emotionalTag);
    }
}
