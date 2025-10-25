// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShiftToScrollchainAutonomyIndex {
    address public steward;

    struct AutonomyEntry {
        string workerID; // "Vinvin-Shift-001"
        string shiftType; // "8 hours", "10 hours", "12 hours"
        string autonomySignal; // "Voluntary", "Scrollchain opt-in", "Worker-led scheduling"
        string emotionalTag;
        bool honored;
        bool sealed;
    }

    AutonomyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function honorAutonomy(string memory workerID, string memory shiftType, string memory autonomySignal, string memory emotionalTag) external onlySteward {
        entries.push(AutonomyEntry(workerID, shiftType, autonomySignal, emotionalTag, true, false));
    }

    function sealAutonomyEntry(uint256 index) external onlySteward {
        require(entries[index].honored, "Must be honored first");
        entries[index].sealed = true;
    }

    function getAutonomyEntry(uint256 index) external view returns (AutonomyEntry memory) {
        return entries[index];
    }
}
