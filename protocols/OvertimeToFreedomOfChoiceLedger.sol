// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OvertimeToFreedomOfChoiceLedger {
    address public steward;

    struct OvertimeEntry {
        string workerID; // "Vinvin-Shift-001"
        string overtimeStatus; // "Opted in", "Declined"
        string choiceMethod; // "Scrollchain consent", "Supervisor log", "Worker portal"
        string emotionalTag;
        bool recorded;
        bool sealed;
    }

    OvertimeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function recordOvertime(string memory workerID, string memory overtimeStatus, string memory choiceMethod, string memory emotionalTag) external onlySteward {
        entries.push(OvertimeEntry(workerID, overtimeStatus, choiceMethod, emotionalTag, true, false));
    }

    function sealOvertimeEntry(uint256 index) external onlySteard {
        require(entries[index].recorded, "Must be recorded first");
        entries[index].sealed = true;
    }

    function getOvertimeEntry(uint256 index) external view returns (OvertimeEntry memory) {
        return entries[index];
    }
}
