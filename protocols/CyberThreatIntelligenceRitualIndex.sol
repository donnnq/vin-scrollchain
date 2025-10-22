// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CyberThreatIntelligenceRitualIndex {
    address public admin;

    struct ThreatEntry {
        string threatName; // "CVE-2025-33073"
        string threatVector; // "Malicious SMB server", "SYSTEM privilege escalation"
        string ritualSignal; // "Forensic trace", "Patch broadcast", "Containment audit"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ThreatEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function indexThreat(string memory threatName, string memory threatVector, string memory ritualSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(ThreatEntry(threatName, threatVector, ritualSignal, emotionalTag, true, false));
    }

    function sealThreatEntry(uint256 index) external onlyAdmin {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getThreatEntry(uint256 index) external view returns (ThreatEntry memory) {
        return entries[index];
    }
}
