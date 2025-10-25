// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OptOutToWellnessClauseProtocol {
    address public steward;

    struct WellnessEntry {
        string workerID; // "Vinvin-Shift-001"
        string optOutReason; // "Health", "Family", "Fatigue"
        string clauseType; // "Wellness protection", "Scrollchain shield", "Labor dignity clause"
        string emotionalTag;
        bool protected;
        bool sealed;
    }

    WellnessEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function protectWellness(string memory workerID, string memory optOutReason, string memory clauseType, string memory emotionalTag) external onlySteward {
        entries.push(WellnessEntry(workerID, optOutReason, clauseType, emotionalTag, true, false));
    }

    function sealWellnessEntry(uint256 index) external onlySteward {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getWellnessEntry(uint256 index) external view returns (WellnessEntry memory) {
        return entries[index];
    }
}
