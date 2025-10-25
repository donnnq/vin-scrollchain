// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShiftToWorkerAutonomyProtocol {
    address public steward;

    struct ShiftEntry {
        string workerID; // "Vinvin-Shift-001"
        string preferredShift; // "8 hours", "10 hours", "12 hours"
        string autonomySignal; // "Freedom of choice", "Voluntary scheduling", "Scrollchain opt-in"
        string emotionalTag;
        bool honored;
        bool sealed;
    }

    ShiftEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function honorShift(string memory workerID, string memory preferredShift, string memory autonomySignal, string memory emotionalTag) external onlySteward {
        entries.push(ShiftEntry(workerID, preferredShift, autonomySignal, emotionalTag, true, false));
    }

    function sealShiftEntry(uint256 index) external onlySteward {
        require(entries[index].honored, "Must be honored first");
        entries[index].sealed = true;
    }

    function getShiftEntry(uint256 index) external view returns (ShiftEntry memory) {
        return entries[index];
    }
}
