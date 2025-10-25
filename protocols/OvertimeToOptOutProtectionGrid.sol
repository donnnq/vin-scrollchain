// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OvertimeToOptOutProtectionGrid {
    address public steward;

    struct OptOutEntry {
        string workerID; // "Vinvin-Shift-001"
        string optOutReason; // "Health", "Family", "Fatigue"
        string protectionMethod; // "Scrollchain shield", "Supervisor override block", "Labor dignity clause"
        string emotionalTag;
        bool protected;
        bool sealed;
    }

    OptOutEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function protectOptOut(string memory workerID, string memory optOutReason, string memory protectionMethod, string memory emotionalTag) external onlySteward {
        entries.push(OptOutEntry(workerID, optOutReason, protectionMethod, emotionalTag, true, false));
    }

    function sealOptOutEntry(uint256 index) external onlySteward {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getOptOutEntry(uint256 index) external view returns (OptOutEntry memory) {
        return entries[index];
    }
}
