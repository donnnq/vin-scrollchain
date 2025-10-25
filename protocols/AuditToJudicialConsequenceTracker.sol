// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditToJudicialConsequenceTracker {
    address public steward;

    struct ConsequenceEntry {
        string auditSource; // "Scrollchain trace", "Whistleblower report", "Tiangco disclosure"
        string violationType; // "Budget manipulation", "Ghost insertion", "Project selling"
        string consequenceType; // "Public trial", "Asset freeze", "Legislative expulsion"
        string emotionalTag;
        bool tracked;
        bool sealed;
    }

    ConsequenceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function trackConsequence(string memory auditSource, string memory violationType, string memory consequenceType, string memory emotionalTag) external onlySteward {
        entries.push(ConsequenceEntry(auditSource, violationType, consequenceType, emotionalTag, true, false));
    }

    function sealConsequenceEntry(uint256 index) external onlySteward {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getConsequenceEntry(uint256 index) external view returns (ConsequenceEntry memory) {
        return entries[index];
    }
}
