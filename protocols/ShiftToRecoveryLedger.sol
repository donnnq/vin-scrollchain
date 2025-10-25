// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShiftToRecoveryLedger {
    address public steward;

    struct RecoveryEntry {
        string shiftSchedule; // "7AM to 7PM"
        string recoveryMethod; // "15-min cooldown", "Hydration break", "Rotational push team"
        string heatZone; // "Oven corridor"
        string emotionalTag;
        bool logged;
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

    function logRecovery(string memory shiftSchedule, string memory recoveryMethod, string memory heatZone, string memory emotionalTag) external onlySteward {
        entries.push(RecoveryEntry(shiftSchedule, recoveryMethod, heatZone, emotionalTag, true, false));
    }

    function sealRecoveryEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getRecoveryEntry(uint256 index) external view returns (RecoveryEntry memory) {
        return entries[index];
    }
}
