// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LeadershipAuditToResignationTracker {
    address public steward;

    struct ResignationEntry {
        string leaderName; // "Koko Pimentel"
        string role; // "Senate President"
        string auditOutcome; // "Neglect", "Oversight", "Complicity"
        string resignationStatus; // "Requested", "Pending", "Refused"
        string emotionalTag;
        bool tracked;
        bool sealed;
    }

    ResignationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function trackResignation(string memory leaderName, string memory role, string memory auditOutcome, string memory resignationStatus, string memory emotionalTag) external onlySteward {
        entries.push(ResignationEntry(leaderName, role, auditOutcome, resignationStatus, emotionalTag, true, false));
    }

    function sealResignationEntry(uint256 index) external onlySteward {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getResignationEntry(uint256 index) external view returns (ResignationEntry memory) {
        return entries[index];
    }
}
