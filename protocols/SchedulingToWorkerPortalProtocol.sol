// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchedulingToWorkerPortalProtocol {
    address public steward;

    struct PortalEntry {
        string workerID; // "Vinvin-Shift-001"
        string chosenShift; // "8 hours", "10 hours", "12 hours"
        string schedulingMethod; // "Worker portal", "Scrollchain opt-in", "Supervisor approval"
        string emotionalTag;
        bool scheduled;
        bool sealed;
    }

    PortalEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function scheduleShift(string memory workerID, string memory chosenShift, string memory schedulingMethod, string memory emotionalTag) external onlySteward {
        entries.push(PortalEntry(workerID, chosenShift, schedulingMethod, emotionalTag, true, false));
    }

    function sealPortalEntry(uint256 index) external onlySteward {
        require(entries[index].scheduled, "Must be scheduled first");
        entries[index].sealed = true;
    }

    function getPortalEntry(uint256 index) external view returns (PortalEntry memory) {
        return entries[index];
    }
}
