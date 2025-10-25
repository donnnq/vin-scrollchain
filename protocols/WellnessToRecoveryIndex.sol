// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WellnessToRecoveryIndex {
    address public steward;

    struct RecoveryEntry {
        string workerID; // "Vinvin-Shift-001"
        string recoveryType; // "Hydration break", "Cooldown zone", "Mental health pause"
        string triggerReason; // "Opt-out", "Fatigue", "Heat exposure"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    RecoveryEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateRecovery(string memory workerID, string memory recoveryType, string memory triggerReason, string memory emotionalTag) external onlySteward {
        entries.push(RecoveryEntry(workerID, recoveryType, triggerReason, emotionalTag, true, false));
    }

    function sealRecoveryEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getRecoveryEntry(uint256 index) external view returns (RecoveryEntry memory) {
        return entries[index];
    }
}
